// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static String m0(genresCount, movie_genre) =>
      "${Intl.plural(genresCount, zero: 'Genre: ${movie_genre}', one: 'Genre: ${movie_genre}', other: 'Genres: ${movie_genre}')}";

  static String m1(movie_id) => "ID: ${movie_id}";

  static String m2(movie_originalLanguage) =>
      "Original language: ${movie_originalLanguage}";

  static String m3(movie_popularity) => "Popularity: ${movie_popularity}";

  static String m4(movie_releaseDate) => "Release Date: ${movie_releaseDate}";

  static String m5(movie_title) => "Title: ${movie_title}";

  static String m6(movie_voteAverage) => "Average rating: ${movie_voteAverage}";

  static String m7(movie_voteCount) => "Number of votes: ${movie_voteCount}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bottom_navbar_favorites":
            MessageLookupByLibrary.simpleMessage("Favorites"),
        "bottom_navbar_movies": MessageLookupByLibrary.simpleMessage("Films"),
        "common_network_error": MessageLookupByLibrary.simpleMessage(
            "There was a problem with the connection x.x"),
        "detail_appbar_title": MessageLookupByLibrary.simpleMessage("Details"),
        "detail_error_state": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with this movie..."),
        "detail_movie_genre": m0,
        "detail_movie_id": m1,
        "detail_movie_original_language": m2,
        "detail_movie_overview_title":
            MessageLookupByLibrary.simpleMessage("Synopsis"),
        "detail_movie_popularity": m3,
        "detail_movie_release_date": m4,
        "detail_movie_title": m5,
        "detail_movie_vote_average": m6,
        "detail_movie_vote_count": m7,
        "error_page_appbar":
            MessageLookupByLibrary.simpleMessage("Page not found"),
        "error_page_state": MessageLookupByLibrary.simpleMessage(
            "Something went wrong opening this page x.x"),
        "error_page_try_again":
            MessageLookupByLibrary.simpleMessage("Try again"),
        "favorite_add": MessageLookupByLibrary.simpleMessage(
            "Favorite successfully added."),
        "favorite_error": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with this favorite..."),
        "favorite_removed": MessageLookupByLibrary.simpleMessage(
            "Favorite successfully removed."),
        "favorites_appbar_title":
            MessageLookupByLibrary.simpleMessage("Favorites"),
        "favorites_empty":
            MessageLookupByLibrary.simpleMessage("No favorites yet ;("),
        "home_appbar_title":
            MessageLookupByLibrary.simpleMessage("Tokenlab Films"),
        "home_error_state": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with x.x movies")
      };
}
