import 'package:domain/entities/movie.dart';
import 'package:domain/use_cases/get_movie_favorite_list_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data_repositories/movie_data_repository_test.mocks.dart';

void main() {
  final mockMovieDataRepository = MockMovieDataRepository();
  final useCase = GetMovieFavoriteListUc(repository: mockMovieDataRepository);
  const tMovieId = 5;
  final tMovie = Movie(id: tMovieId, title: 'test title', posterUrl: 'testurl');
  final mockedFavoriteBox = {
    tMovieId: tMovieId,
  };
  final mockedMoviesBox = {
    tMovieId: tMovie,
    4: Movie(id: 4, title: 'other test title', posterUrl: 'testurl'),
  };
  test(
    'should get the list of favorite movies from the box with movieIds',
    () async {
      when(mockMovieDataRepository.fetchMovieFavoriteList()).thenAnswer(
        (_) async => Future.value(
          mockedMoviesBox.values
              .where(
                (movie) => mockedFavoriteBox.containsKey(movie.id),
              )
              .toList(),
        ),
      );

      final result = await useCase.getFuture(params: null);

      expect(
        result.first,
        equals(
          tMovie,
        ),
      );

      expect(result.length, 1);

      verify(mockMovieDataRepository.fetchMovieFavoriteList()).called(1);
      verifyNoMoreInteractions(mockMovieDataRepository);
    },
  );
}
