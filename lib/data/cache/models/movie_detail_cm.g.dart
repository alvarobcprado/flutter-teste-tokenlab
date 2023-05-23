// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailCmAdapter extends TypeAdapter<MovieDetailCm> {
  @override
  final int typeId = 3;

  @override
  MovieDetailCm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailCm(
      id: fields[10] as int,
      posterUrl: fields[0] as String,
      title: fields[1] as String,
      genres: (fields[2] as List).cast<String>(),
      releaseDate: fields[3] as String,
      originalLanguage: fields[4] as String,
      voteAverage: fields[5] as double,
      popularity: fields[6] as double,
      voteCount: fields[7] as int,
      imdbId: fields[8] as String,
      overview: fields[9] as String,
      isFavorite: fields[11] == null ? false : fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailCm obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.posterUrl)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.genres)
      ..writeByte(3)
      ..write(obj.releaseDate)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.voteCount)
      ..writeByte(8)
      ..write(obj.imdbId)
      ..writeByte(9)
      ..write(obj.overview)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailCmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
