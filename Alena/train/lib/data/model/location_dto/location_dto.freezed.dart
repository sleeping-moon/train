// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationDTO _$LocationDTOFromJson(Map<String, dynamic> json) {
  return _LocationDTO.fromJson(json);
}

/// @nodoc
mixin _$LocationDTO {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDTOCopyWith<LocationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDTOCopyWith<$Res> {
  factory $LocationDTOCopyWith(
          LocationDTO value, $Res Function(LocationDTO) then) =
      _$LocationDTOCopyWithImpl<$Res, LocationDTO>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$LocationDTOCopyWithImpl<$Res, $Val extends LocationDTO>
    implements $LocationDTOCopyWith<$Res> {
  _$LocationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationDTOCopyWith<$Res>
    implements $LocationDTOCopyWith<$Res> {
  factory _$$_LocationDTOCopyWith(
          _$_LocationDTO value, $Res Function(_$_LocationDTO) then) =
      __$$_LocationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_LocationDTOCopyWithImpl<$Res>
    extends _$LocationDTOCopyWithImpl<$Res, _$_LocationDTO>
    implements _$$_LocationDTOCopyWith<$Res> {
  __$$_LocationDTOCopyWithImpl(
      _$_LocationDTO _value, $Res Function(_$_LocationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_LocationDTO(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationDTO implements _LocationDTO {
  const _$_LocationDTO({required this.name, required this.url});

  factory _$_LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LocationDTOFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'LocationDTO(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationDTOCopyWith<_$_LocationDTO> get copyWith =>
      __$$_LocationDTOCopyWithImpl<_$_LocationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationDTOToJson(
      this,
    );
  }
}

abstract class _LocationDTO implements LocationDTO {
  const factory _LocationDTO(
      {required final String name, required final String url}) = _$_LocationDTO;

  factory _LocationDTO.fromJson(Map<String, dynamic> json) =
      _$_LocationDTO.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_LocationDTOCopyWith<_$_LocationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
