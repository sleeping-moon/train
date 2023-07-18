import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@Freezed()
class LocationDTO with _$LocationDTO {
  const factory LocationDTO({
    required String name,
    required String url,
  }) = _LocationDTO;

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDTOFromJson(json);

}
