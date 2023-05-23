import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/data/remote/data_source/movie_rds.dart';
import 'package:teste_tokenlab/data/remote/infrastructure/token_films_dio.dart';
import 'package:teste_tokenlab/data/remote/models/movie_rm.dart';

import 'movie_rds_mock_data.dart';
import 'movie_rds_test.mocks.dart';

@GenerateMocks([TokenFilmsDio])
void main() {
  final mockedDio = MockTokenFilmsDio();
  late final MovieRds movieRds;

  setUpAll(
    () {
      movieRds = MovieRds(
        dio: mockedDio,
      );
    },
  );

  group(
    'test the fetchMovies method from movie remote data source',
    () {
      test(
        'should get a list of movies from remote data source',
        () async {
          when(mockedDio.get(any)).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(path: '/'),
              data: mockedResponseData,
            ),
          );

          final list = await movieRds.fetchMovies();
          expect(list, isA<List<MovieRm>>());
          verify(mockedDio.get(any)).called(1);
          verifyNoMoreInteractions(mockedDio);
        },
      );
      test(
        'should get a list with 3 movieRM',
        () async {
          when(mockedDio.get(any)).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(path: '/'),
              data: mockedResponseData,
            ),
          );

          final list = await movieRds.fetchMovies();
          expect(list.length, mockedResponseData.length);
          expect(list.first.title, mockedResponseData.first['title']);
          verify(mockedDio.get(any)).called(1);
          verifyNoMoreInteractions(mockedDio);
        },
      );

      test(
        'should throw an exception when calling dio unsuccessfuly',
        () async {
          when(mockedDio.get(any)).thenThrow(Exception());
          expect(movieRds.fetchMovies, throwsException);
          verify(mockedDio.get(any)).called(1);
          verifyNoMoreInteractions(mockedDio);
        },
      );
    },
  );

  group(
    'test the fetchMovieDetail method from movie remote data source',
    () {
      test(
        'should get detail from movie with id 238',
        () async {
          when(mockedDio.get(any)).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(path: '/'),
              data: mockedMovieDetail,
            ),
          );

          final movieDetail = await movieRds.fetchMovieDetail(238);

          expect(movieDetail.id, mockedMovieDetail['id']);
          verify(mockedDio.get(any)).called(1);
          verifyNoMoreInteractions(mockedDio);
        },
      );
      test(
        'should throw an exception when fetching a movie with invalid id',
        () async {
          when(mockedDio.get(any)).thenThrow(Exception());

          expect(() => movieRds.fetchMovieDetail(1111), throwsException);
        },
      );
    },
  );
}
