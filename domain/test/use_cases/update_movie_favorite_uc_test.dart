import 'package:domain/entities/movie_detail.dart';
import 'package:domain/use_cases/update_movie_favorite_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data_repositories/movie_data_repository_test.mocks.dart';

void main() {
  final mockMovieDataRepository = MockMovieDataRepository();
  final useCase = UpdateMovieFavoriteUc(
    repository: mockMovieDataRepository,
  );

  final tMovieDetail = MovieDetail(
    id: 1,
    posterUrl: 'test.com',
    title: 'test title',
    genres: ['test genre'],
    releaseDate: 'test date',
    originalLanguage: 'test language',
    voteAverage: 9.99,
    popularity: 10,
    voteCount: 777,
    imdbId: 'test ID',
    overview: 'test overview',
    isFavorite: false,
  );

  final mockedBox = {
    1: tMovieDetail,
  };
  test(
    'should update favorite property in movie_detail entity',
    () async {
      when(mockMovieDataRepository.updateMovieFavorite(any)).thenAnswer(
        (realInvocation) async {
          tMovieDetail.isFavorite = !tMovieDetail.isFavorite;
          mockedBox.update(1, (_) => realInvocation.positionalArguments.first);
        },
      );

      await useCase.getFuture(
        params: UpdateMovieFavoriteUcParams(
          movieDetail: tMovieDetail,
        ),
      );

      expect(mockedBox[1]!.isFavorite, true);

      verify(mockMovieDataRepository.updateMovieFavorite(tMovieDetail));
      verifyNoMoreInteractions(mockMovieDataRepository);
    },
  );
}
