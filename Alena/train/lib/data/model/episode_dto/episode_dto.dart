import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_dto.freezed.dart';
part 'episode_dto.g.dart';

@Freezed()
class EpisodeDTO with _$EpisodeDTO {
  const factory EpisodeDTO({
    required String name,
    required String episode,
  }) = _EpisodeDTO;

  factory EpisodeDTO.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDTOFromJson(json);

}