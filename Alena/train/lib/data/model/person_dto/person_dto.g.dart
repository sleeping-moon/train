// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonDTO _$$_PersonDTOFromJson(Map<String, dynamic> json) => _$_PersonDTO(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: LocationDTO.fromJson(json['origin'] as Map<String, dynamic>),
      image: json['image'] as String,
      location: LocationDTO.fromJson(json['location'] as Map<String, dynamic>),
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$_PersonDTOToJson(_$_PersonDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'image': instance.image,
      'location': instance.location,
      'episode': instance.episode,
      'created': instance.created.toIso8601String(),
    };
