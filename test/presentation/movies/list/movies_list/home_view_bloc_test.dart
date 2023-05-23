import 'package:domain/exceptions.dart';
import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/presentation/movies/list/movies_list/home_view_bloc.dart';
import 'package:teste_tokenlab/presentation/movies/list/movies_list/home_view_state.dart';

import 'home_view_bloc_test.mocks.dart';

@GenerateMocks([GetMovieListUc])
void main() {
  late HomeViewBloc homeBloc;
  late MockGetMovieListUc mockedUc;

  setUpAll(() {
    mockedUc = MockGetMovieListUc();
  });

  setUp(
    () {
      homeBloc = HomeViewBloc(
        getMovieListUc: mockedUc,
      );
    },
  );

  tearDown(() => homeBloc.dispose());

  group(
    'test homeBloc',
    () {
      test(
        'should complete HomeViewState success cycle after call tryStartMovies',
        () async {
          when(mockedUc.getFuture()).thenAnswer((_) async => []);
          homeBloc.process(const TryStartMovies());
          await expectLater(
            homeBloc.stateStream,
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
        'should emits NetworkError state if useCase'
        'throws a NoConnectionException',
        () async {
          when(mockedUc.getFuture()).thenThrow(NoConnectionException());

          homeBloc.process(const TryStartMovies());
          await expectLater(
            homeBloc.stateStream,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Loading>(),
                isA<NetworkError>(),
              ],
            ),
          );
        },
      );
      test(
        'should emits Error state if useCase throws an exception',
        () async {
          when(mockedUc.getFuture()).thenThrow(Exception());

          homeBloc.process(const TryStartMovies());
          await expectLater(
            homeBloc.stateStream,
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
