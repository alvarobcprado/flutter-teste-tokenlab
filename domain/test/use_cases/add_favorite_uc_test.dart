import 'package:domain/use_cases/add_favorite_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data_repositories/movie_data_repository_test.mocks.dart';

void main() {
  final mockMovieDataRepository = MockMovieDataRepository();
  final useCase = AddFavoriteUc(repository: mockMovieDataRepository);
  final mockedBox = {};
  const tmovieId = 5;
  test(
    'should add the movieId to favoriteBox',
    () async {
      when(mockMovieDataRepository.addFavorite(any)).thenAnswer(
        (realInvocation) async {
          mockedBox.putIfAbsent(
            realInvocation.positionalArguments.first,
            () => realInvocation.positionalArguments.first,
          );
        },
      );

      await useCase.getFuture(
        params: const AddFavoriteUcParams(movieId: tmovieId),
      );

      expect(mockedBox.values.first, tmovieId);
      verify(mockMovieDataRepository.addFavorite(tmovieId));
      verifyNoMoreInteractions(mockMovieDataRepository);
    },
  );
}
