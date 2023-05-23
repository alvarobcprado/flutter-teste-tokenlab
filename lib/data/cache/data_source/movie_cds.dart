// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import '../models/movie_cm.dart';
import '../models/movie_detail_cm.dart';

class MovieCds {
  Future<bool> isMoviesBoxEmpty() async =>
      Hive.openBox<MovieCm>('moviesBox').then(
        (moviesBox) => moviesBox.isEmpty,
      );

  Future<void> addAllMovies(List<MovieCm> movieList) async {
    await Hive.openBox<MovieCm>('moviesBox').then(
      (moviesBox) => moviesBox.putAll(
        {for (var movie in movieList) movie.id: movie},
      ),
    );
  }

  Future<List<MovieCm>> fetchAllMovies() async =>
      Hive.openBox<MovieCm>('moviesBox').then(
        (moviesBox) => moviesBox.values.toList(),
      );

  Future<bool> isMovieInBox(int movieId) async =>
      Hive.openBox<MovieDetailCm>('movieDetailBox').then(
        (movieDetailBox) => movieDetailBox.keys.contains(movieId),
      );

  Future<void> addMovie(MovieDetailCm movieDetail) async {
    await Hive.openBox<MovieDetailCm>('movieDetailBox').then(
      (movieDetailBox) {
        movieDetailBox.put(movieDetail.id, movieDetail);
      },
    );
  }

  Future<MovieDetailCm?> fetchMovieDetail(int movieId) async {
    final movieDetail =
        await Hive.openBox<MovieDetailCm>('movieDetailBox').then(
      (movieDetailBox) => movieDetailBox.get(movieId),
    );

    return movieDetail;
  }

  Future<void> addFavorite(int movieId) async =>
      Hive.openBox<int>('favoritesBox').then(
        (favoritesBox) => favoritesBox.put(movieId, movieId),
      );

  Future<void> removeFavorite(int movieId) async =>
      Hive.openBox<int>('favoritesBox').then(
        (favoritesBox) => favoritesBox.delete(movieId),
      );

  Future<List<int>> fetchFavorites() async =>
      Hive.openBox<int>('favoritesBox').then(
        (favoritesBox) => favoritesBox.values.toList(),
      );
}
