import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:train/data/model/location_dto/location_dto.dart';

import '../episode_dto/episode_dto.dart';

part 'person_dto.freezed.dart';
part 'person_dto.g.dart';

@Freezed()
class PersonDTO with _$PersonDTO {
  const factory PersonDTO(
      {required int id,
      required String name,
      required String status,
      required String species,
      required String type,
      required String gender,
      required LocationDTO origin,
      required String image,
      required LocationDTO location,
      required List<String> episode,
      required DateTime created}) = _PersonDTO;

  factory PersonDTO.fromJson(Map<String, dynamic> json) =>
      _$PersonDTOFromJson(json);

}
