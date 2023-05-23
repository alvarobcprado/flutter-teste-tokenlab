// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'movie_rm.g.dart';

///Model dos filmes obtidos a partir da URL base da api
@JsonSerializable(fieldRename: FieldRename.snake)
class MovieRm {
  MovieRm({
    required this.id,
    required this.title,
    required this.posterUrl,
  });
  factory MovieRm.fromJson(Map<String, dynamic> json) =>
      _$MovieRmFromJson(json);

  Map<String, dynamic> toJson(MovieRm movie) => _$MovieRmToJson(movie);

  final int id;
  final String title;
  final String posterUrl;
}
