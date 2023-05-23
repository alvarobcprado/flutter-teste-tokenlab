// Package imports:
import 'package:domain/entities/movie_detail.dart';
import 'package:hive/hive.dart';

// Project imports:
import '../../remote/models/movie_detail_rm.dart';

part 'movie_detail_cm.g.dart';

@HiveType(typeId: 3)
class MovieDetailCm {
  MovieDetailCm({
    required this.id,
    required this.posterUrl,
    required this.title,
    required this.genres,
    required this.releaseDate,
    required this.originalLanguage,
    required this.voteAverage,
    required this.popularity,
    required this.voteCount,
    required this.imdbId,
    required this.overview,
    this.isFavorite = false,
  });

  factory MovieDetailCm.fromRemoteModel(MovieDetailRm movieDetail) =>
      MovieDetailCm(
        id: movieDetail.id,
        posterUrl: movieDetail.posterUrl,
        title: movieDetail.title,
        genres: movieDetail.genres,
        releaseDate: movieDetail.releaseDate,
        originalLanguage: movieDetail.originalLanguage,
        voteAverage: movieDetail.voteAverage,
        popularity: movieDetail.popularity,
        voteCount: movieDetail.voteCount,
        imdbId: movieDetail.imdbId,
        overview: movieDetail.overview,
      );

  factory MovieDetailCm.fromEntity(MovieDetail movieDetail) => MovieDetailCm(
        id: movieDetail.id,
        posterUrl: movieDetail.posterUrl,
        title: movieDetail.title,
        genres: movieDetail.genres,
        releaseDate: movieDetail.releaseDate,
        originalLanguage: movieDetail.originalLanguage,
        voteAverage: movieDetail.voteAverage,
        popularity: movieDetail.popularity,
        voteCount: movieDetail.voteCount,
        imdbId: movieDetail.imdbId,
        overview: movieDetail.overview,
        isFavorite: movieDetail.isFavorite,
      );

  MovieDetail toEntity() => MovieDetail(
        id: id,
        posterUrl: posterUrl,
        title: title,
        genres: genres,
        releaseDate: releaseDate,
        originalLanguage: originalLanguage,
        voteAverage: voteAverage,
        popularity: popularity,
        voteCount: voteCount,
        imdbId: imdbId,
        overview: overview,
        isFavorite: isFavorite,
      );

  @HiveField(0)
  final String posterUrl;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final List<String> genres;
  @HiveField(3)
  final String releaseDate;
  @HiveField(4)
  final String originalLanguage;
  @HiveField(5)
  final double voteAverage;
  @HiveField(6)
  final double popularity;
  @HiveField(7)
  final int voteCount;
  @HiveField(8)
  final String imdbId;
  @HiveField(9)
  final String overview;
  @HiveField(10)
  final int id;
  @HiveField(11, defaultValue: false)
  bool isFavorite;
}
