import 'dart:convert';

class MovieModel {
  final int id;
  final double voteAverage;
  final String title;
  final String posterUrl;
  final List<String> genres;
  final String releaseDate;

  MovieModel({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'voteAverage': voteAverage,
      'title': title,
      'posterUrl': posterUrl,
      'genres': genres,
      'releaseDate': releaseDate,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      voteAverage: map['voteAverage'],
      title: map['title'],
      posterUrl: map['posterUrl'],
      genres: List<String>.from(map['genres']),
      releaseDate: map['releaseDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
