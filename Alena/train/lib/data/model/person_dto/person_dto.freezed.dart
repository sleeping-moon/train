// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonDTO _$PersonDTOFromJson(Map<String, dynamic> json) {
  return _PersonDTO.fromJson(json);
}

/// @nodoc
mixin _$PersonDTO {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  LocationDTO get origin => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  LocationDTO get location => throw _privateConstructorUsedError;
  List<String> get episode => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonDTOCopyWith<PersonDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonDTOCopyWith<$Res> {
  factory $PersonDTOCopyWith(PersonDTO value, $Res Function(PersonDTO) then) =
      _$PersonDTOCopyWithImpl<$Res, PersonDTO>;
  @useResult
  $Res call(
      {int id,
      String name,
      String status,
      String species,
      String type,
      String gender,
      LocationDTO origin,
      String image,
      LocationDTO location,
      List<String> episode,
      DateTime created});

  $LocationDTOCopyWith<$Res> get origin;
  $LocationDTOCopyWith<$Res> get location;
}

/// @nodoc
class _$PersonDTOCopyWithImpl<$Res, $Val extends PersonDTO>
    implements $PersonDTOCopyWith<$Res> {
  _$PersonDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? image = null,
    Object? location = null,
    Object? episode = null,
    Object? created = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as LocationDTO,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationDTO,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationDTOCopyWith<$Res> get origin {
    return $LocationDTOCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationDTOCopyWith<$Res> get location {
    return $LocationDTOCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PersonDTOCopyWith<$Res> implements $PersonDTOCopyWith<$Res> {
  factory _$$_PersonDTOCopyWith(
          _$_PersonDTO value, $Res Function(_$_PersonDTO) then) =
      __$$_PersonDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String status,
      String species,
      String type,
      String gender,
      LocationDTO origin,
      String image,
      LocationDTO location,
      List<String> episode,
      DateTime created});

  @override
  $LocationDTOCopyWith<$Res> get origin;
  @override
  $LocationDTOCopyWith<$Res> get location;
}

/// @nodoc
class __$$_PersonDTOCopyWithImpl<$Res>
    extends _$PersonDTOCopyWithImpl<$Res, _$_PersonDTO>
    implements _$$_PersonDTOCopyWith<$Res> {
  __$$_PersonDTOCopyWithImpl(
      _$_PersonDTO _value, $Res Function(_$_PersonDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? image = null,
    Object? location = null,
    Object? episode = null,
    Object? created = null,
  }) {
    return _then(_$_PersonDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as LocationDTO,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationDTO,
      episode: null == episode
          ? _value._episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PersonDTO implements _PersonDTO {
  const _$_PersonDTO(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.image,
      required this.location,
      required final List<String> episode,
      required this.created})
      : _episode = episode;

  factory _$_PersonDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PersonDTOFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String species;
  @override
  final String type;
  @override
  final String gender;
  @override
  final LocationDTO origin;
  @override
  final String image;
  @override
  final LocationDTO location;
  final List<String> _episode;
  @override
  List<String> get episode {
    if (_episode is EqualUnmodifiableListView) return _episode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episode);
  }

  @override
  final DateTime created;

  @override
  String toString() {
    return 'PersonDTO(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, image: $image, location: $location, episode: $episode, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._episode, _episode) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      image,
      location,
      const DeepCollectionEquality().hash(_episode),
      created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonDTOCopyWith<_$_PersonDTO> get copyWith =>
      __$$_PersonDTOCopyWithImpl<_$_PersonDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonDTOToJson(
      this,
    );
  }
}

abstract class _PersonDTO implements PersonDTO {
  const factory _PersonDTO(
      {required final int id,
      required final String name,
      required final String status,
      required final String species,
      required final String type,
      required final String gender,
      required final LocationDTO origin,
      required final String image,
      required final LocationDTO location,
      required final List<String> episode,
      required final DateTime created}) = _$_PersonDTO;

  factory _PersonDTO.fromJson(Map<String, dynamic> json) =
      _$_PersonDTO.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get status;
  @override
  String get species;
  @override
  String get type;
  @override
  String get gender;
  @override
  LocationDTO get origin;
  @override
  String get image;
  @override
  LocationDTO get location;
  @override
  List<String> get episode;
  @override
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  _$$_PersonDTOCopyWith<_$_PersonDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
