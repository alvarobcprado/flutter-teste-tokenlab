import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/intl_commons.dart';
import 'package:teste_tokenlab/presentation/common/states/states.dart';
import 'package:teste_tokenlab/presentation/movies/detail/detail_view.dart';
import 'package:teste_tokenlab/presentation/movies/detail/detail_view_bloc.dart';
import 'package:teste_tokenlab/presentation/movies/detail/detail_view_state.dart';
import 'package:teste_tokenlab/presentation/movies/detail/widgets/detail_view_sucess_state_widget.dart';

import 'detail_view_bloc_test_data.dart';
import 'detail_view_widget_test.mocks.dart';

@GenerateMocks([DetailViewBloc])
void main() {
  late MockDetailViewBloc detailViewBloc;
  late PublishSubject<DetailViewState> movieStatePublishController;
  late PublishSubject<DetailViewAction> eventActionPublishController;

  setUpAll(
    () {
      S.load(const Locale('en'));
    },
  );

  setUp(
    () {
      detailViewBloc = MockDetailViewBloc();
      movieStatePublishController = PublishSubject<DetailViewState>();
      eventActionPublishController = PublishSubject<DetailViewAction>();
    },
  );

  tearDown(
    () {
      movieStatePublishController.close();
      eventActionPublishController.close();
      detailViewBloc.dispose();
    },
  );

  Future<void> _createWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate,
        ],
        home: DetailsView(
          movieId: 1,
          bloc: detailViewBloc,
        ),
      ),
    );
  }

  testWidgets(
    'should build movie detail widget when bloc emits success state',
    (tester) async {
      when(detailViewBloc.onMovieDetailStateChange).thenAnswer(
        (_) => movieStatePublishController,
      );
      when(detailViewBloc.onEventAction).thenAnswer(
        (_) => eventActionPublishController,
      );
      await _createWidget(tester);
      await tester.pump();
      movieStatePublishController.add(
        Success(movieDetail: movieDetailTest),
      );
      await tester.pumpAndSettle();
      expect(find.byType(DetailViewSucessStateWidget), findsOneWidget);
      expect(
        find.text(
          S.current.detail_movie_title(
            movieDetailTest.title,
          ),
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'should build error page when bloc emits error state',
    (tester) async {
      when(detailViewBloc.onMovieDetailStateChange).thenAnswer(
        (_) => movieStatePublishController,
      );
      when(detailViewBloc.onEventAction).thenAnswer(
        (_) => eventActionPublishController,
      );
      await _createWidget(tester);
      await tester.pump();
      movieStatePublishController.add(
        const Error(),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('errorPage')), findsOneWidget);
    },
  );

  testWidgets(
    'should show snackbar with success text when bloc emits '
    ' success state and event action state',
    (tester) async {
      when(detailViewBloc.onMovieDetailStateChange).thenAnswer(
        (_) => movieStatePublishController,
      );
      when(detailViewBloc.onEventAction).thenAnswer(
        (_) => eventActionPublishController,
      );
      await _createWidget(tester);
      await tester.pump();
      movieStatePublishController.add(
        Success(movieDetail: movieDetailTest),
      );
      await tester.pumpAndSettle();
      await tester.pump();

      eventActionPublishController.add(
        FavoriteAddedSnackbar(),
      );

      // fonte: https://github.com/flutter/flutter/blob/master/packages/flutter/test/material/snack_bar_test.dart
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        find.text(
          S.current.favorite_add,
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'should show snackbar with error text when bloc emits '
    ' success state and event action error state',
    (tester) async {
      when(detailViewBloc.onMovieDetailStateChange).thenAnswer(
        (_) => movieStatePublishController,
      );
      when(detailViewBloc.onEventAction).thenAnswer(
        (_) => eventActionPublishController,
      );
      await _createWidget(tester);
      await tester.pump();
      movieStatePublishController.add(
        Success(movieDetail: movieDetailTest),
      );
      await tester.pumpAndSettle();
      await tester.pump();

      eventActionPublishController.add(
        FavoriteErrorSnackbar(),
      );

      // fonte: https://github.com/flutter/flutter/blob/master/packages/flutter/test/material/snack_bar_test.dart
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        find.text(
          S.current.favorite_error,
        ),
        findsOneWidget,
      );
    },
  );
}
