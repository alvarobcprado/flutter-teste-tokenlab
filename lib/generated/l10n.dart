// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Favoritos`
  String get bottom_navbar_favorites {
    return Intl.message(
      'Favoritos',
      name: 'bottom_navbar_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Filmes`
  String get bottom_navbar_movies {
    return Intl.message(
      'Filmes',
      name: 'bottom_navbar_movies',
      desc: '',
      args: [],
    );
  }

  /// `Aconteceu algum problema com a conexão x.x`
  String get common_network_error {
    return Intl.message(
      'Aconteceu algum problema com a conexão x.x',
      name: 'common_network_error',
      desc: '',
      args: [],
    );
  }

  /// `Detalhes`
  String get detail_appbar_title {
    return Intl.message(
      'Detalhes',
      name: 'detail_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Algo deu errado com esse filme...`
  String get detail_error_state {
    return Intl.message(
      'Algo deu errado com esse filme...',
      name: 'detail_error_state',
      desc: '',
      args: [],
    );
  }

  /// `{genresCount, plural, zero{Gênero: {movie_genre}} one{Gênero: {movie_genre}} other{Gênero(s): {movie_genre}}}`
  String detail_movie_genre(num genresCount, Object movie_genre) {
    return Intl.plural(
      genresCount,
      zero: 'Gênero: $movie_genre',
      one: 'Gênero: $movie_genre',
      other: 'Gênero(s): $movie_genre',
      name: 'detail_movie_genre',
      desc: '',
      args: [genresCount, movie_genre],
    );
  }

  /// `ID: {movie_id}`
  String detail_movie_id(Object movie_id) {
    return Intl.message(
      'ID: $movie_id',
      name: 'detail_movie_id',
      desc: '',
      args: [movie_id],
    );
  }

  /// `Idioma original: {movie_originalLanguage}`
  String detail_movie_original_language(Object movie_originalLanguage) {
    return Intl.message(
      'Idioma original: $movie_originalLanguage',
      name: 'detail_movie_original_language',
      desc: '',
      args: [movie_originalLanguage],
    );
  }

  /// `Sinopse`
  String get detail_movie_overview_title {
    return Intl.message(
      'Sinopse',
      name: 'detail_movie_overview_title',
      desc: '',
      args: [],
    );
  }

  /// `Popularidade: {movie_popularity}`
  String detail_movie_popularity(Object movie_popularity) {
    return Intl.message(
      'Popularidade: $movie_popularity',
      name: 'detail_movie_popularity',
      desc: '',
      args: [movie_popularity],
    );
  }

  /// `Data de lançamento: {movie_releaseDate}`
  String detail_movie_release_date(Object movie_releaseDate) {
    return Intl.message(
      'Data de lançamento: $movie_releaseDate',
      name: 'detail_movie_release_date',
      desc: '',
      args: [movie_releaseDate],
    );
  }

  /// `Título: {movie_title}`
  String detail_movie_title(Object movie_title) {
    return Intl.message(
      'Título: $movie_title',
      name: 'detail_movie_title',
      desc: '',
      args: [movie_title],
    );
  }

  /// `Nota média: {movie_voteAverage}`
  String detail_movie_vote_average(Object movie_voteAverage) {
    return Intl.message(
      'Nota média: $movie_voteAverage',
      name: 'detail_movie_vote_average',
      desc: '',
      args: [movie_voteAverage],
    );
  }

  /// `Número de votos: {movie_voteCount}`
  String detail_movie_vote_count(Object movie_voteCount) {
    return Intl.message(
      'Número de votos: $movie_voteCount',
      name: 'detail_movie_vote_count',
      desc: '',
      args: [movie_voteCount],
    );
  }

  /// `Página não encontrada`
  String get error_page_appbar {
    return Intl.message(
      'Página não encontrada',
      name: 'error_page_appbar',
      desc: '',
      args: [],
    );
  }

  /// `Algo deu errado ao abrir essa página x.x`
  String get error_page_state {
    return Intl.message(
      'Algo deu errado ao abrir essa página x.x',
      name: 'error_page_state',
      desc: '',
      args: [],
    );
  }

  /// `Tentar Novamente`
  String get error_page_try_again {
    return Intl.message(
      'Tentar Novamente',
      name: 'error_page_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Favorito adicionado com sucesso.`
  String get favorite_add {
    return Intl.message(
      'Favorito adicionado com sucesso.',
      name: 'favorite_add',
      desc: '',
      args: [],
    );
  }

  /// `Algo deu errado com esse favorito...`
  String get favorite_error {
    return Intl.message(
      'Algo deu errado com esse favorito...',
      name: 'favorite_error',
      desc: '',
      args: [],
    );
  }

  /// `Favorito removido com sucesso.`
  String get favorite_removed {
    return Intl.message(
      'Favorito removido com sucesso.',
      name: 'favorite_removed',
      desc: '',
      args: [],
    );
  }

  /// `Favoritos`
  String get favorites_appbar_title {
    return Intl.message(
      'Favoritos',
      name: 'favorites_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Nenhum favorito ainda ;(`
  String get favorites_empty {
    return Intl.message(
      'Nenhum favorito ainda ;(',
      name: 'favorites_empty',
      desc: '',
      args: [],
    );
  }

  /// `Tokenlab Filmes`
  String get home_appbar_title {
    return Intl.message(
      'Tokenlab Filmes',
      name: 'home_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Algo deu errado com os filmes x.x`
  String get home_error_state {
    return Intl.message(
      'Algo deu errado com os filmes x.x',
      name: 'home_error_state',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
