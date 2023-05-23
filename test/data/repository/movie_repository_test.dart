import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/data/cache/data_source/movie_cds.dart';
import 'package:teste_tokenlab/data/remote/data_source/movie_rds.dart';
import 'package:teste_tokenlab/data/repository/movie_repository.dart';

import 'movie_repository_mock_data.dart';
import 'movie_repository_test.mocks.dart';

@GenerateMocks([MovieCds, MovieRds])
void main() {
  late MovieRepository movieRepo;
  late MockMovieCds mockedMovieCds;
  late MockMovieRds mockedMovieRds;

  setUp(
    () {
      mockedMovieCds = MockMovieCds();
      mockedMovieRds = MockMovieRds();
      movieRepo = MovieRepository(
        cacheDataSource: mockedMovieCds,
        remoteDataSource: mockedMovieRds,
      );
    },
  );
  group(
    'test the movieList methods from MovieRepository',
    () {
      test(
        'should get the list of Movie entity using remoteDataSource',
        () async {
          when(mockedMovieCds.isMoviesBoxEmpty()).thenAnswer(
            (_) async => true,
          );
          when(mockedMovieRds.fetchMovies()).thenAnswer(
            (_) async => movieRmTestList,
          );

          when(mockedMovieCds.addAllMovies(any)).thenAnswer((_) async {});

          final result = await movieRepo.fetchMovieList();

          expect(result, isA<List<Movie>>());
          verify(mockedMovieCds.isMoviesBoxEmpty()).called(1);
          verify(mockedMovieCds.addAllMovies(any)).called(1);
          verify(mockedMovieRds.fetchMovies()).called(1);
          verifyNoMoreInteractions(mockedMovieRds);
          verifyNoMoreInteractions(mockedMovieCds);
        },
      );
      test(
        'should get the list of Movie entity without using remoteDataSource',
        () async {
          when(mockedMovieCds.isMoviesBoxEmpty()).thenAnswer(
            (_) async => movieCmTestList.isEmpty,
          );
          when(mockedMovieCds.fetchAllMovies()).thenAnswer(
            (_) async => movieCmTestList,
          );

          final result = await movieRepo.fetchMovieList();

          expect(result, isA<List<Movie>>());
          verify(mockedMovieCds.isMoviesBoxEmpty()).called(1);
          verify(mockedMovieCds.fetchAllMovies()).called(1);
          verifyZeroInteractions(mockedMovieRds);
          verifyNoMoreInteractions(mockedMovieCds);
        },
      );
    },
  );

  group(
    'test the movieDetail methods from MovieRepository',
    () {
      test(
        'should get movieDetail entity using remoteDataSource',
        () async {
          when(mockedMovieCds.isMovieInBox(any)).thenAnswer((_) async => false);
          when(mockedMovieRds.fetchMovieDetail(any)).thenAnswer(
            (_) async => movieDetailRmTest,
          );
          when(mockedMovieCds.addMovie(any)).thenAnswer((_) async => {});

          final result = await movieRepo.fetchMovieDetail(1);

          expect(result, isA<MovieDetail>());
          expect(result.title, movieDetailRmTest.title);
          verify(mockedMovieCds.isMovieInBox(any)).called(1);
          verify(mockedMovieRds.fetchMovieDetail(any)).called(1);
          verify(mockedMovieCds.addMovie(any)).called(1);
          verifyNoMoreInteractions(mockedMovieRds);
          verifyNoMoreInteractions(mockedMovieCds);
        },
      );
      test(
        'should get movieDetail entity without using remoteDataSource',
        () async {
          when(mockedMovieCds.isMovieInBox(any)).thenAnswer((_) async => true);
          when(mockedMovieCds.fetchMovieDetail(any)).thenAnswer(
            (_) async => movieDetailCmTest,
          );

          final result = await movieRepo.fetchMovieDetail(1);

          expect(result, isA<MovieDetail>());
          expect(result.title, movieDetailCmTest.title);
          verify(mockedMovieCds.isMovieInBox(any)).called(1);
          verify(mockedMovieCds.fetchMovieDetail(any)).called(1);
          verifyNoMoreInteractions(mockedMovieCds);
          verifyZeroInteractions(mockedMovieRds);
        },
      );
    },
  );

  group(
    'test favorites methods from Movie Repository',
    () {
      test(
        'should update isFavorite property of the movieDetail',
        () async {
          when(mockedMovieCds.addMovie(any)).thenAnswer(
            (_) async {},
          );
          await movieRepo.updateMovieFavorite(movieDetailEntityTest);
          verify(mockedMovieCds.addMovie(any)).called(1);
          verifyNoMoreInteractions(mockedMovieCds);
          verifyZeroInteractions(mockedMovieRds);
        },
      );

      test(
        'should get the list of favoriteMovies ',
        () async {
          when(mockedMovieCds.fetchFavorites()).thenAnswer(
            (_) async => favoriteIdMoviesTest,
          );
          when(mockedMovieCds.fetchAllMovies()).thenAnswer(
            (_) async => movieCmTestList,
          );

          final result = await movieRepo.fetchMovieFavoriteList();

          expect(result.length, favoriteIdMoviesTest.length);
          expect(result.last.title, movieCmTestList.last.title);
          verify(mockedMovieCds.fetchFavorites()).called(1);
          verify(mockedMovieCds.fetchAllMovies()).called(1);
          verifyNoMoreInteractions(mockedMovieCds);
          verifyZeroInteractions(mockedMovieRds);
        },
      );
    },
  );
}
