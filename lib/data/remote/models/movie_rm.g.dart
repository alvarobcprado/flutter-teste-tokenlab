// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRm _$MovieRmFromJson(Map<String, dynamic> json) {
  return MovieRm(
    id: json['id'] as int,
    title: json['title'] as String,
    posterUrl: json['poster_url'] as String,
  );
}

Map<String, dynamic> _$MovieRmToJson(MovieRm instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_url': instance.posterUrl,
    };
