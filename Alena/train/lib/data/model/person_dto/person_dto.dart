import 'package:train/data/model/location_dto.dart';
import 'package:train/domain/entitie/person_entity.dart';
import 'package:freezed/builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
      required DateTime created}) = _PersonDTO;

  factory PersonDTO.fromJson(Map<String, dynamic> json) =>
      _$PersonDTOFromJson(json);

  /*Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin,
      'image': image,
      'location': location,
      'created': created
    };
  }*/
  /*static List<Person> toPerson(List<PersonDTO> personModelList) {
    List<Person> newPersonList = [];
    for (int i = 0; i < personModelList.length; i++) {
      newPersonList.add(Person(
          id: personModelList[i].id,
          name: personModelList[i].name,
          status: personModelList[i].status,
          species: personModelList[i].species,
          type: personModelList[i].type,
          gender: personModelList[i].gender,
          origin: LocationModel.toLocation(personModelList[i].origin),
          image: personModelList[i].image,
          location: LocationModel.toLocation(personModelList[i].location),
          created: personModelList[i].created));
    }
    return newPersonList;
  }*/
}
