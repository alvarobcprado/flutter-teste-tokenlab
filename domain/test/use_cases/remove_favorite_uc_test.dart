import 'package:domain/use_cases/remove_favorite_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data_repositories/movie_data_repository_test.mocks.dart';

void main() {
  final mockMovieDataRepository = MockMovieDataRepository();

  final useCase = RemoveFavoriteUc(repository: mockMovieDataRepository);

  const tMovieId = 5;
  final mockedBox = {
    tMovieId: tMovieId,
  };

  test(
    'should remove movieId from favoriteBox',
    () async {
      when(mockMovieDataRepository.removeFavorite(any)).thenAnswer(
        (realInvocation) async => mockedBox.remove(
          realInvocation.positionalArguments.first,
        ),
      );

      await useCase.getFuture(
        params: RemoveFavoriteUcParams(movieId: tMovieId),
      );

      expect(mockedBox.containsKey(tMovieId), false);
      verify(mockMovieDataRepository.removeFavorite(tMovieId));
      verifyNoMoreInteractions(mockMovieDataRepository);
    },
  );
}
