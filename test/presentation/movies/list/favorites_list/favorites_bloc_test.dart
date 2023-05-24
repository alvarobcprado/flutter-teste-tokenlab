import 'package:domain/use_cases/get_movie_favorite_list_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/presentation/movies/list/favorites_list/favorites_bloc.dart';
import 'package:teste_tokenlab/presentation/movies/list/favorites_list/favorites_view_state.dart';

import 'favorites_bloc_test.mocks.dart';

@GenerateMocks([GetMovieFavoriteListUc])
void main() {
  late FavoritesBloc favoritesBloc;
  late MockGetMovieFavoriteListUc mockedUc;

  setUpAll(() {
    mockedUc = MockGetMovieFavoriteListUc();
  });

  setUp(
    () {
      favoritesBloc = FavoritesBloc(
        getMovieFavoriteListUc: mockedUc,
      );
    },
  );

  tearDown(() => favoritesBloc.dispose());

  group(
    'test favoritesBloc',
    () {
      test(
        'should complete HomeViewState success cycle after call onFocused',
        () async {
          when(mockedUc.getFuture(
            params: anyNamed('params'),
          )).thenAnswer((_) async => []);
          favoritesBloc.process(const TryStartFavorites());
          await expectLater(
            favoritesBloc.stateStream,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Loading>(),
                isA<Success>(),
              ],
            ),
          );
        },
      );
      test(
        'should emits Error state if useCase throws an exception',
        () async {
          when(mockedUc.getFuture(
            params: anyNamed('params'),
          )).thenThrow(Exception());
          favoritesBloc.process(const TryStartFavorites());
          await expectLater(
            favoritesBloc.stateStream,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Loading>(),
                isA<Error>(),
              ],
            ),
          );
        },
      );
    },
  );
}
