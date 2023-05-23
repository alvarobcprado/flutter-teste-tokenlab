// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieCmAdapter extends TypeAdapter<MovieCm> {
  @override
  final int typeId = 2;

  @override
  MovieCm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieCm(
      id: fields[0] as int,
      title: fields[1] as String,
      posterUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieCm obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieCmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
