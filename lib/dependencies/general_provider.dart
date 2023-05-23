// Package imports:
import 'package:dio/dio.dart';
import 'package:domain/use_cases/add_favorite_uc.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:domain/use_cases/get_movie_favorite_list_uc.dart';
import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:domain/use_cases/remove_favorite_uc.dart';
import 'package:domain/use_cases/update_movie_favorite_uc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Project imports:
import '../data/cache/data_source/movie_cds.dart';
import '../data/remote/data_source/movie_rds.dart';
import '../data/remote/infrastructure/token_films_dio.dart';
import '../data/repository/movie_repository.dart';

List<SingleChildWidget> googleServices = [
  Provider<FirebaseAnalytics>(
    create: (_) => FirebaseAnalytics.instance,
  ),
];

List<SingleChildWidget> independentServices = [
  Provider<Dio>(
    create: (_) {
      final options = BaseOptions(
        baseUrl: 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies',
      );

      return TokenFilmsDio(options);
    },
  ),
  ..._cacheDataSourceProviders,
];

List<SingleChildWidget> dependentServices = [
  ..._remoteDataSourceProviders,
  ..._repositoryProviders,
  ..._useCaseProviders,
];

List<SingleChildWidget> _repositoryProviders = [
  ProxyProvider2<MovieRds, MovieCds, MovieRepository>(
    update: (_, remoteDataSource, movieCacheDataSource, __) => MovieRepository(
      cacheDataSource: movieCacheDataSource,
      remoteDataSource: remoteDataSource,
    ),
  ),
];

List<SingleChildWidget> _cacheDataSourceProviders = [
  Provider<MovieCds>(
    create: (_) => MovieCds(),
  ),
];

List<SingleChildWidget> _remoteDataSourceProviders = [
  ProxyProvider<Dio, MovieRds>(
    update: (_, dio, __) => MovieRds(
      dio: dio,
    ),
  ),
];

List<SingleChildWidget> _useCaseProviders = [
  ProxyProvider<MovieRepository, AddFavoriteUc>(
    update: (_, repository, __) => AddFavoriteUc(repository: repository),
  ),
  ProxyProvider<MovieRepository, GetMovieDetailUc>(
    update: (_, repository, __) => GetMovieDetailUc(repository: repository),
  ),
  ProxyProvider<MovieRepository, GetMovieFavoriteListUc>(
    update: (_, repository, __) =>
        GetMovieFavoriteListUc(repository: repository),
  ),
  ProxyProvider<MovieRepository, GetMovieListUc>(
    update: (_, repository, __) => GetMovieListUc(repository: repository),
  ),
  ProxyProvider<MovieRepository, RemoveFavoriteUc>(
    update: (_, repository, __) => RemoveFavoriteUc(repository: repository),
  ),
  ProxyProvider<MovieRepository, UpdateMovieFavoriteUc>(
    update: (_, repository, __) =>
        UpdateMovieFavoriteUc(repository: repository),
  ),
];
