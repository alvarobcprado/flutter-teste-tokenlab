// Flutter imports:
import 'dart:async';

// Package imports:
import 'package:domain/use_cases/add_favorite_uc.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:domain/use_cases/get_movie_favorite_list_uc.dart';
import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:domain/use_cases/remove_favorite_uc.dart';
import 'package:domain/use_cases/update_movie_favorite_uc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'data/cache/models/movie_cm.dart';
import 'data/cache/models/movie_detail_cm.dart';
import 'dependencies/general_provider.dart';
import 'intl_commons.dart';
import 'presentation/common/widgets/error_page_view.dart';
import 'presentation/main_screen.dart';
import 'presentation/movies/detail/detail_view.dart';
import 'presentation/movies/detail/detail_view_bloc.dart';
import 'presentation/movies/list/favorites_list/favorites_bloc.dart';
import 'presentation/movies/list/favorites_list/favorites_view.dart';
import 'presentation/movies/list/movies_list/home_view.dart';
import 'presentation/movies/list/movies_list/home_view_bloc.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      await Hive.initFlutter();
      await Firebase.initializeApp();
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      Hive
        ..registerAdapter<MovieCm>(
          MovieCmAdapter(),
        )
        ..registerAdapter<MovieDetailCm>(
          MovieDetailCmAdapter(),
        );

      FluroRouter.appRouter
        ..define(
          HomeView.routeName,
          handler: Handler(
            handlerFunc: (_, __) => ProxyProvider<GetMovieListUc, HomeViewBloc>(
              update: (_, getMovieListUc, __) => HomeViewBloc(
                getMovieListUc: getMovieListUc,
              ),
              builder: (context, _) => HomeView(
                bloc: context.read<HomeViewBloc>(),
              ),
              dispose: (_, homeViewBloc) => homeViewBloc.dispose(),
            ),
          ),
        )
        ..define(
          '${DetailsView.routeName}/:id',
          handler: Handler(
            handlerFunc: (context, parameters) {
              final movieId = int.parse(parameters['id']![0]);
              return ProxyProvider4<GetMovieDetailUc, AddFavoriteUc,
                  RemoveFavoriteUc, UpdateMovieFavoriteUc, DetailViewBloc>(
                update: (_, getMovieDetailUc, addFavoriteUc, removeFavoriteUc,
                        updateMovieFavoriteUc, __) =>
                    DetailViewBloc(
                  movieId: movieId,
                  getMovieDetailUc: getMovieDetailUc,
                  addFavoriteUc: addFavoriteUc,
                  removeFavoriteUc: removeFavoriteUc,
                  updateMovieFavoriteUc: updateMovieFavoriteUc,
                ),
                builder: (context, child) => DetailsView(
                  movieId: movieId,
                  bloc: context.read<DetailViewBloc>(),
                ),
                dispose: (context, detailViewBloc) => detailViewBloc.dispose(),
              );
            },
          ),
        )
        ..define(
          FavoritesView.routeName,
          handler: Handler(
            handlerFunc: (_, __) =>
                ProxyProvider<GetMovieFavoriteListUc, FavoritesBloc>(
              update: (_, getMovieFavoriteListUc, __) => FavoritesBloc(
                getMovieFavoriteListUc: getMovieFavoriteListUc,
              ),
              builder: (context, _) => FavoritesView(
                bloc: context.read<FavoritesBloc>(),
              ),
            ),
          ),
        )
        ..define(
          ErrorPageView.routeName,
          handler: Handler(
            handlerFunc: (context, parameters) => ErrorPageView(
              errorText: S.current.error_page_state,
              onTryAgain: () => Navigator.of(context!)
                  .popAndPushNamed(context.settings!.name!),
            ),
          ),
        );
      runApp(
        MultiProvider(
          providers: [
            ...googleServices,
            ...independentServices,
            ...dependentServices,
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Treino Mobile Tokenlab',
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
        navigatorObservers: <NavigatorObserver>[
          FirebaseAnalyticsObserver(
            analytics: context.read<FirebaseAnalytics>(),
          ),
        ],
        onGenerateRoute: (settings) => FluroRouter.appRouter
            .matchRoute(context, settings.name, routeSettings: settings)
            .route,
      );
}
