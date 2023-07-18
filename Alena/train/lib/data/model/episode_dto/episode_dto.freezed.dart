// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeDTO _$EpisodeDTOFromJson(Map<String, dynamic> json) {
  return _EpisodeDTO.fromJson(json);
}

/// @nodoc
mixin _$EpisodeDTO {
  String get name => throw _privateConstructorUsedError;
  String get episode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeDTOCopyWith<EpisodeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeDTOCopyWith<$Res> {
  factory $EpisodeDTOCopyWith(
          EpisodeDTO value, $Res Function(EpisodeDTO) then) =
      _$EpisodeDTOCopyWithImpl<$Res, EpisodeDTO>;
  @useResult
  $Res call({String name, String episode});
}

/// @nodoc
class _$EpisodeDTOCopyWithImpl<$Res, $Val extends EpisodeDTO>
    implements $EpisodeDTOCopyWith<$Res> {
  _$EpisodeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? episode = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EpisodeDTOCopyWith<$Res>
    implements $EpisodeDTOCopyWith<$Res> {
  factory _$$_EpisodeDTOCopyWith(
          _$_EpisodeDTO value, $Res Function(_$_EpisodeDTO) then) =
      __$$_EpisodeDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String episode});
}

/// @nodoc
class __$$_EpisodeDTOCopyWithImpl<$Res>
    extends _$EpisodeDTOCopyWithImpl<$Res, _$_EpisodeDTO>
    implements _$$_EpisodeDTOCopyWith<$Res> {
  __$$_EpisodeDTOCopyWithImpl(
      _$_EpisodeDTO _value, $Res Function(_$_EpisodeDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? episode = null,
  }) {
    return _then(_$_EpisodeDTO(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeDTO implements _EpisodeDTO {
  const _$_EpisodeDTO({required this.name, required this.episode});

  factory _$_EpisodeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeDTOFromJson(json);

  @override
  final String name;
  @override
  final String episode;

  @override
  String toString() {
    return 'EpisodeDTO(name: $name, episode: $episode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.episode, episode) || other.episode == episode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, episode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeDTOCopyWith<_$_EpisodeDTO> get copyWith =>
      __$$_EpisodeDTOCopyWithImpl<_$_EpisodeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeDTOToJson(
      this,
    );
  }
}

abstract class _EpisodeDTO implements EpisodeDTO {
  const factory _EpisodeDTO(
      {required final String name,
      required final String episode}) = _$_EpisodeDTO;

  factory _EpisodeDTO.fromJson(Map<String, dynamic> json) =
      _$_EpisodeDTO.fromJson;

  @override
  String get name;
  @override
  String get episode;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeDTOCopyWith<_$_EpisodeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
