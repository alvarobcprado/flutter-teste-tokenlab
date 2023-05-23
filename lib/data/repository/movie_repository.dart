// Package imports:
import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';

// Project imports:
import '../cache/data_source/movie_cds.dart';
import '../cache/models/movie_cm.dart';
import '../cache/models/movie_detail_cm.dart';
import '../remote/data_source/movie_rds.dart';

class MovieRepository extends MovieDataRepository {
  MovieRepository({
    required this.cacheDataSource,
    required this.remoteDataSource,
  });
  final MovieCds cacheDataSource;
  final MovieRds remoteDataSource;

  @override
  Future<List<Movie>> fetchMovieList() async {
    var movieList = <MovieCm>[];
    final isBoxEmpty = await cacheDataSource.isMoviesBoxEmpty();
    if (isBoxEmpty) {
      await remoteDataSource.fetchMovies().then(
        (remoteMovies) {
          movieList = remoteMovies
              .map(
                (remoteMovie) => MovieCm.fromRemoteModel(remoteMovie),
              )
              .toList();
        },
      );

      await cacheDataSource.addAllMovies(movieList);
    } else {
      movieList = await cacheDataSource.fetchAllMovies();
    }
    return movieList.map((movieCm) => movieCm.toEntity()).toList();
  }

  @override
  Future<MovieDetail> fetchMovieDetail(int movieId) async {
    final MovieDetailCm detailMovie;
    if (!await cacheDataSource.isMovieInBox(movieId)) {
      detailMovie = MovieDetailCm.fromRemoteModel(
        await remoteDataSource.fetchMovieDetail(movieId),
      );
      await cacheDataSource.addMovie(detailMovie);
    } else {
      detailMovie = (await cacheDataSource.fetchMovieDetail(movieId))!;
    }
    return detailMovie.toEntity();
  }

  @override
  Future<void> updateMovieFavorite(MovieDetail movieDetail) async {
    await cacheDataSource.addMovie(
      MovieDetailCm.fromEntity(movieDetail),
    );
  }

  @override
  Future<void> addFavorite(int movieId) async {
    await cacheDataSource.addFavorite(movieId);
  }

  @override
  Future<void> removeFavorite(int movieId) async {
    await cacheDataSource.removeFavorite(movieId);
  }

  @override
  Future<List<Movie>> fetchMovieFavoriteList() async {
    final favoriteIdList = await cacheDataSource.fetchFavorites();
    var movieList = <Movie>[];
    movieList = await cacheDataSource.fetchAllMovies().then(
          (movieCmList) =>
              movieCmList.map((movieCm) => movieCm.toEntity()).toList(),
        );

    return movieList
        .where((movie) => favoriteIdList.contains(movie.id))
        .toList();
  }
}
