// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeHiveAdapter extends TypeAdapter<EpisodeHive> {
  @override
  final int typeId = 2;

  @override
  EpisodeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeHive(
      id: fields[0] as int,
      name: fields[1] as String,
      episode: fields[2] as String,
      pass: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.episode)
      ..writeByte(3)
      ..write(obj.pass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
