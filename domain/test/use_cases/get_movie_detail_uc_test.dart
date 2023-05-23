import 'package:domain/entities/movie_detail.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import '../data_repositories/movie_data_repository_test.mocks.dart';

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
);

void main() {
  final mockMovieDataRepository = MockMovieDataRepository();
  final useCase = GetMovieDetailUc(repository: mockMovieDataRepository);
  test(
    'should get the details of movie by movieId from repository',
    () async {
      when(mockMovieDataRepository.fetchMovieDetail(any)).thenAnswer(
        (_) async => tMovieDetail,
      );

      final result = await useCase.getFuture(
        params: const GetMovieDetailUcParams(1),
      );

      expect(result, equals(tMovieDetail));

      verify(mockMovieDataRepository.fetchMovieDetail(1));
      verifyNoMoreInteractions(mockMovieDataRepository);
    },
  );
}
