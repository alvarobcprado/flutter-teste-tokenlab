import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';

abstract class MovieDataRepository {
  const MovieDataRepository();

  Future<List<Movie>> fetchMovieList();

  Future<MovieDetail> fetchMovieDetail(int movieId);

  Future<void> updateMovieFavorite(MovieDetail movieDetail);

  Future<void> addFavorite(int movieId);

  Future<void> removeFavorite(int movieId);

  Future<List<Movie>> fetchMovieFavoriteList();
}
