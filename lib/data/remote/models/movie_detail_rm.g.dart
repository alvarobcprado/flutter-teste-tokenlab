// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailRm _$MovieDetailRmFromJson(Map<String, dynamic> json) =>
    MovieDetailRm(
      id: json['id'] as int,
      posterUrl: json['poster_url'] as String,
      title: json['title'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      releaseDate: json['release_date'] as String,
      originalLanguage: json['original_language'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      imdbId: json['imdb_id'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$MovieDetailRmToJson(MovieDetailRm instance) =>
    <String, dynamic>{
      'poster_url': instance.posterUrl,
      'title': instance.title,
      'genres': instance.genres,
      'release_date': instance.releaseDate,
      'original_language': instance.originalLanguage,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'imdb_id': instance.imdbId,
      'overview': instance.overview,
      'id': instance.id,
    };
