import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/intl_commons.dart';
import 'package:teste_tokenlab/presentation/common/widgets/loading_state_widget.dart';
import 'package:teste_tokenlab/presentation/movies/list/movies_list/home_view.dart';
import 'package:teste_tokenlab/presentation/movies/list/movies_list/home_view_bloc.dart';
import 'package:teste_tokenlab/presentation/movies/list/movies_list/home_view_state.dart';

import 'home_view_test_data.dart';
import 'home_view_widget_test.mocks.dart';

@GenerateMocks([HomeViewBloc])
void main() {
  late MockHomeViewBloc homeViewBloc;

  Future<void> _createWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate,
        ],
        home: HomeView(
          bloc: homeViewBloc,
        ),
      ),
    );
  }

  setUpAll(
    () {
      S.load(const Locale('en'));
    },
  );

  setUp(
    () {
      homeViewBloc = MockHomeViewBloc();
    },
  );

  tearDown(
    () {
      homeViewBloc.dispose();
    },
  );

  testWidgets(
    'should load list of movies when bloc emits success state',
    (tester) async {
      when(homeViewBloc.state).thenReturn(
        Success(movieList: listMoviesTest),
      );

      await tester.runAsync(
        () async {
          await _createWidget(tester);
          await tester.pump();
          await tester.pump();
          expect(
            find.byKey(const ValueKey('homeView-successState')),
            findsWidgets,
          );
          expect(find.text(listMoviesTest.first.title), findsWidgets);
        },
      );
    },
  );

  testWidgets(
    'should build error page view when bloc emits error state',
    (tester) async {
      when(homeViewBloc.state).thenReturn(
        const Error(),
      );
      await tester.runAsync(
        () async {
          await _createWidget(tester);
          await tester.pumpAndSettle();
          expect(
            find.byKey(const ValueKey('errorPage')),
            findsWidgets,
          );
          expect(find.text(S.current.home_error_state), findsWidgets);
        },
      );
    },
  );

  testWidgets(
    'should build loading page view when bloc emits loading state',
    (tester) async {
      when(homeViewBloc.state).thenReturn(
        const Loading(),
      );
      await tester.runAsync(
        () async {
          await _createWidget(tester);
          await tester.pump();

          expect(find.byType(LoadingStateWidget), findsWidgets);
        },
      );
    },
  );
}
