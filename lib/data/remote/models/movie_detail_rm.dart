// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_rm.g.dart';

///Model dos filmes obtidos a partir da URL específica na API
@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailRm {
  MovieDetailRm({
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
  });

  ///Serialização do JSON para o Model
  factory MovieDetailRm.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailRmFromJson(json);

  ///Desserialização do Model para JSON
  Map<String, dynamic> toJson(MovieDetailRm movieDetail) =>
      _$MovieDetailRmToJson(movieDetail);

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
}
