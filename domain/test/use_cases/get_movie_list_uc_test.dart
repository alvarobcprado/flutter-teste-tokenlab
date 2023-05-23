import 'package:domain/entities/movie.dart';
import 'package:domain/use_cases/get_movie_list_uc.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data_repositories/movie_data_repository_test.mocks.dart';

void main() {
  GetMovieListUc usecase;
  MockMovieDataRepository mockMovieDataRepository;

  mockMovieDataRepository = MockMovieDataRepository();
  usecase = GetMovieListUc(repository: mockMovieDataRepository);

  final tFirstMovie = Movie(
      id: 19404,
      title: 'Dilwale Dulhania Le Jayenge',
      posterUrl:
          'https://image.tmdb.org/t/p/w200/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg');

  test(
    'should get movie list from the repository',
    () async {
      when(
        mockMovieDataRepository.fetchMovieList(),
      ).thenAnswer((realInvocation) async => Future.value([tFirstMovie]));

      final result = await usecase.getFuture(params: null);

      expect(result, isA<List<Movie>>());

      verify(mockMovieDataRepository.fetchMovieList());

      verifyNoMoreInteractions(mockMovieDataRepository);
    },
  );
}
