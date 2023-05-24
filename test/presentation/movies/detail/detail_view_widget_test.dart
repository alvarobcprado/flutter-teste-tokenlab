import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/intl_commons.dart';
import 'package:teste_tokenlab/presentation/movies/detail/detail_view.dart';
import 'package:teste_tokenlab/presentation/movies/detail/detail_view_bloc.dart';
import 'package:teste_tokenlab/presentation/movies/detail/detail_view_state.dart';
import 'package:teste_tokenlab/presentation/movies/detail/widgets/detail_view_sucess_state_widget.dart';

import 'detail_view_bloc_test_data.dart';
import 'detail_view_widget_test.mocks.dart';

@GenerateMocks([DetailViewBloc])
void main() {
  late MockDetailViewBloc detailViewBloc;

  setUpAll(
    () {
      S.load(const Locale('en'));
    },
  );

  setUp(() {
    detailViewBloc = MockDetailViewBloc();
  });

  tearDown(
    () {
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
      when(detailViewBloc.state).thenReturn(
        Success(movieDetail: movieDetailTest),
      );

      await _createWidget(tester);
      await tester.pump();
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
      when(detailViewBloc.state).thenReturn(const Error());
      await _createWidget(tester);
      await tester.pump();

      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('errorPage')), findsOneWidget);
    },
  );

  testWidgets(
    'should show snackbar with success text when bloc emits '
    ' success state and event action state',
    (tester) async {
      final actionCompleter = Completer<void>();

      when(detailViewBloc.state).thenReturn(
        Success(movieDetail: movieDetailTest),
      );
      when(detailViewBloc.listenAction(any)).thenAnswer((invocation) async {
        await actionCompleter.future;
        invocation.positionalArguments[0](FavoriteAddedSnackbar());
      });

      await _createWidget(tester);
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.byType(DetailViewSucessStateWidget), findsOneWidget);

      actionCompleter.complete();

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
      final actionCompleter = Completer<void>();

      when(detailViewBloc.state).thenAnswer(
        (_) => Success(movieDetail: movieDetailTest),
      );

      when(detailViewBloc.listenAction(any)).thenAnswer((invocation) async {
        await actionCompleter.future;
        invocation.positionalArguments[0](FavoriteErrorSnackbar());
      });

      await _createWidget(tester);
      await tester.pump();
      await tester.pumpAndSettle();
      await tester.pump();

      actionCompleter.complete();

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
