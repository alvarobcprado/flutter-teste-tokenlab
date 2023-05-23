// Package imports:
import 'package:domain/entities/movie_detail.dart';
import 'package:intl/intl.dart';

class DetailViewModel {
  DetailViewModel({
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

  final String posterUrl;

  final String title;

  final List<String> genres;

  final String releaseDate;

  final String originalLanguage;

  final double voteAverage;

  final double popularity;

  final int voteCount;

  final String imdbId;

  final String overview;

  final int id;

  bool isFavorite;
}

extension DetailViewMappers on MovieDetail {
  DetailViewModel toVM() => DetailViewModel(
        id: id,
        posterUrl: posterUrl,
        title: title,
        genres: genres,
        releaseDate: DateFormat.yMd().format(DateTime.parse(releaseDate)),
        originalLanguage: originalLanguage,
        voteAverage: voteAverage,
        popularity: popularity,
        voteCount: voteCount,
        imdbId: imdbId,
        overview: overview,
        isFavorite: isFavorite,
      );
}
