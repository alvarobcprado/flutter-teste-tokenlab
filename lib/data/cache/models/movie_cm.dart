// Package imports:
import 'package:domain/entities/movie.dart';
import 'package:hive/hive.dart';

// Project imports:
import '../../remote/models/movie_rm.dart';

part 'movie_cm.g.dart';

@HiveType(typeId: 2)
class MovieCm {
  MovieCm({
    required this.id,
    required this.title,
    required this.posterUrl,
  });

  factory MovieCm.fromRemoteModel(MovieRm movie) => MovieCm(
        id: movie.id,
        title: movie.title,
        posterUrl: movie.posterUrl,
      );

  Movie toEntity() => Movie(id: id, title: title, posterUrl: posterUrl);

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterUrl;
}
