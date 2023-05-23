class MovieDetail {
  MovieDetail({
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
