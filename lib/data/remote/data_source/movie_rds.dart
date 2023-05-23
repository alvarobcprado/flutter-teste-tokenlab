// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../infrastructure/url_buider.dart';
import '../models/movie_detail_rm.dart';
import '../models/movie_rm.dart';

class MovieRds {
  MovieRds({required this.dio});

  final Dio dio;

  Future<List<MovieRm>> fetchMovies() async {
    final response = await dio.get(PathBuilder.movies());
    final responseData = response.data as List;

    final listMovies = responseData
        .map(
          (movieJson) => MovieRm.fromJson(movieJson),
        )
        .toList();
    return listMovies;
  }

  Future<MovieDetailRm> fetchMovieDetail(int movieId) async {
    final response = await dio.get(PathBuilder.movieDetail(movieId));
    final responseData = response.data;

    final detailMovie = MovieDetailRm.fromJson(responseData);
    return detailMovie;
  }
}
