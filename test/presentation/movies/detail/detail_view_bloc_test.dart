import 'package:domain/exceptions.dart';
import 'package:domain/use_cases/add_favorite_uc.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:domain/use_cases/remove_favorite_uc.dart';
import 'package:domain/use_cases/update_movie_favorite_uc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/intl_commons.dart';
import 'package:teste_tokenlab/presentation/movies/detail/detail_view_bloc.dart';
import 'package:teste_tokenlab/presentation/movies/detail/detail_view_state.dart';
import 'detail_view_bloc_test.mocks.dart';
import 'detail_view_bloc_test_data.dart';

@GenerateMocks(
  [
    GetMovieDetailUc,
    UpdateMovieFavoriteUc,
    AddFavoriteUc,
    RemoveFavoriteUc,
  ],
)
void main() {
  late DetailViewBloc detailViewBloc;
  late final MockGetMovieDetailUc mockGetMovieDetailUc;
  late final MockUpdateMovieFavoriteUc mockUpdateMovieFavoriteUc;
  late final MockAddFavoriteUc mockAddFavoriteUc;
  late final MockRemoveFavoriteUc mockRemoveFavoriteUc;

  setUpAll(
    () {
      mockGetMovieDetailUc = MockGetMovieDetailUc();
      mockUpdateMovieFavoriteUc = MockUpdateMovieFavoriteUc();
      mockAddFavoriteUc = MockAddFavoriteUc();
      mockRemoveFavoriteUc = MockRemoveFavoriteUc();
    },
  );

  setUp(
    () {
      detailViewBloc = DetailViewBloc(
        movieId: 1,
        getMovieDetailUc: mockGetMovieDetailUc,
        updateMovieFavoriteUc: mockUpdateMovieFavoriteUc,
        addFavoriteUc: mockAddFavoriteUc,
        removeFavoriteUc: mockRemoveFavoriteUc,
      );
    },
  );

  tearDown(() => detailViewBloc.dispose());

  group(
    "test the detailViewBloc's tryStartMovieDetail subscription",
    () {
      test(
        'should complete DetailViewState cycle on start the detailViewBloc',
        () async {
          when(
            mockGetMovieDetailUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async => movieDetailTest,
          );

          await expectLater(
            detailViewBloc.onMovieDetailStateChange,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Success>(),
              ],
            ),
          );
        },
      );
      test(
        'should complete DetailViewState success cycle '
        'after call tryStartMovieDetail sink',
        () async {
          when(
            mockGetMovieDetailUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async => movieDetailTest,
          );

          detailViewBloc.tryStartMovieDetail.add(null);

          await expectLater(
            detailViewBloc.onMovieDetailStateChange,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Success>(),
              ],
            ),
          );
        },
      );

      test(
        'should emits NetworkError state if GetMovieDetailUc'
        ' throws NoConnectionException',
        () async {
          when(
            mockGetMovieDetailUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenThrow(NoConnectionException());

          await expectLater(
            detailViewBloc.onMovieDetailStateChange,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<NetworkError>(),
              ],
            ),
          );
        },
      );

      test(
        'should emits Error state if GetMovieDetailUc throws Exception',
        () async {
          when(
            mockGetMovieDetailUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenThrow(Exception());

          await expectLater(
            detailViewBloc.onMovieDetailStateChange,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Error>(),
              ],
            ),
          );
        },
      );
    },
  );

  group(
    "test the detailViewBloc's toggleFavorite subscription",
    () {
      setUpAll(() {
        S.load(
          const Locale('pt'),
        );
      });
      test(
        'should add favorite with complete handling favorites success cycle '
        'after call toggleFavorite sink',
        () async {
          when(
            mockGetMovieDetailUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async => movieDetailTest,
          );
          when(
            mockUpdateMovieFavoriteUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async {},
          );
          when(
            mockAddFavoriteUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          detailViewBloc.toggleFavorite.add(movieDetailTest);

          await expectLater(
            detailViewBloc.onMovieDetailStateChange,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Success>(),
                isA<Success>(),
              ],
            ),
          );
        },
      );

      test(
        'should remove favorite with complete handling favorites success cycle '
        'after call toggleFavorite sink',
        () async {
          when(
            mockGetMovieDetailUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async => movieDetailTest,
          );
          when(
            mockUpdateMovieFavoriteUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async {},
          );
          when(
            mockRemoveFavoriteUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          movieDetailTest.isFavorite = true;
          detailViewBloc.toggleFavorite.add(movieDetailTest);

          await expectLater(
            detailViewBloc.onMovieDetailStateChange,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Success>(),
                isA<Success>(),
              ],
            ),
          );
        },
      );

      test(
        'should not complete the handling favorites success cycle '
        'if any favorite usecases throws an exception when call toggleFavorite',
        () async {
          when(
            mockGetMovieDetailUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async => movieDetailTest,
          );
          when(
            mockUpdateMovieFavoriteUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenThrow(Exception());
          when(
            mockAddFavoriteUc.getFuture(
              params: anyNamed('params'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          detailViewBloc.toggleFavorite.add(movieDetailTest);

          await expectLater(
            detailViewBloc.onMovieDetailStateChange,
            emitsInOrder(
              [
                isA<Loading>(),
                isA<Success>(),
              ],
            ),
          );
        },
      );
    },
  );
}
