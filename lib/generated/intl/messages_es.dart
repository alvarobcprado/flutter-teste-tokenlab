// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(genresCount, movie_genre) =>
      "${Intl.plural(genresCount, zero: 'Género: ${movie_genre}', one: 'Género: ${movie_genre}', other: 'Géneros: ${movie_genre}')}";

  static String m1(movie_id) => "ID: ${movie_id}";

  static String m2(movie_originalLanguage) =>
      "Idioma original: ${movie_originalLanguage}";

  static String m3(movie_popularity) => "Popularidad: ${movie_popularity}";

  static String m4(movie_releaseDate) =>
      "Fecha de lanzamiento: ${movie_releaseDate}";

  static String m5(movie_title) => "Título: ${movie_title}";

  static String m6(movie_voteAverage) =>
      "Pontuación media: ${movie_voteAverage}";

  static String m7(movie_voteCount) => "Número de votos: ${movie_voteCount}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bottom_navbar_favorites":
            MessageLookupByLibrary.simpleMessage("Favoritos"),
        "bottom_navbar_movies":
            MessageLookupByLibrary.simpleMessage("Películas"),
        "common_network_error": MessageLookupByLibrary.simpleMessage(
            "Sucedió un problema con la conexión x.x"),
        "detail_appbar_title": MessageLookupByLibrary.simpleMessage("Detalles"),
        "detail_error_state": MessageLookupByLibrary.simpleMessage(
            "Algo salió mal con esta película x.x"),
        "detail_movie_genre": m0,
        "detail_movie_id": m1,
        "detail_movie_original_language": m2,
        "detail_movie_overview_title":
            MessageLookupByLibrary.simpleMessage("Sinopsis"),
        "detail_movie_popularity": m3,
        "detail_movie_release_date": m4,
        "detail_movie_title": m5,
        "detail_movie_vote_average": m6,
        "detail_movie_vote_count": m7,
        "error_page_appbar":
            MessageLookupByLibrary.simpleMessage("Página no encontrada"),
        "error_page_state": MessageLookupByLibrary.simpleMessage(
            "Algo salió mal al abrir esta página x.x"),
        "error_page_try_again":
            MessageLookupByLibrary.simpleMessage("Intentar nuevamente"),
        "favorite_add": MessageLookupByLibrary.simpleMessage(
            "Favorito agregado correctamente."),
        "favorite_error": MessageLookupByLibrary.simpleMessage(
            "Algo salió mal con este favorito ..."),
        "favorite_removed": MessageLookupByLibrary.simpleMessage(
            "Favorito eliminado correctamente."),
        "favorites_appbar_title":
            MessageLookupByLibrary.simpleMessage("Favoritos"),
        "favorites_empty":
            MessageLookupByLibrary.simpleMessage("Aún no hay favoritos; ("),
        "home_appbar_title":
            MessageLookupByLibrary.simpleMessage("Películas de Tokenlab"),
        "home_error_state": MessageLookupByLibrary.simpleMessage(
            "Algo salió mal con las películas x.x")
      };
}
