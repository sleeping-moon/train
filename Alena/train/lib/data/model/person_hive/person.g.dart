// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonHiveAdapter extends TypeAdapter<PersonHive> {
  @override
  final int typeId = 1;

  @override
  PersonHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonHive(
      id: fields[0] as int,
      name: fields[1] as String,
      status: fields[2] as String,
      species: fields[3] as String,
      type: fields[4] as String,
      gender: fields[5] as String,
      originName: fields[6] as String,
      originURL: fields[7] as String,
      image: fields[8] as String,
      locationName: fields[9] as String,
      episode: (fields[12] as List).cast<String>(),
      locationURL: fields[10] as String,
      created: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PersonHive obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.originName)
      ..writeByte(7)
      ..write(obj.originURL)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.locationName)
      ..writeByte(10)
      ..write(obj.locationURL)
      ..writeByte(11)
      ..write(obj.created)
      ..writeByte(12)
      ..write(obj.episode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
