import '../../../domain/entity/location_entity.dart';
import '../../../domain/entity/person_entity.dart';
import '../person_dto/person_dto.dart';
import '../person_hive/person.dart';
import 'location_mapper.dart';

class PersonMapper{
  static Future<List<Person>> toPersons(List<PersonDTO> personModelList) async {
    List<Person> newPersonList = [];
    for (int i = 0; i < personModelList.length; i++) {
      newPersonList.add(
        Person(
          id: personModelList[i].id,
          name: personModelList[i].name,
          status: personModelList[i].status,
          species: personModelList[i].species,
          type: personModelList[i].type,
          gender: personModelList[i].gender,
          origin: LocationMapper.toLocation(personModelList[i].origin),
          image: personModelList[i].image,
          location: LocationMapper.toLocation(personModelList[i].location),
          created: personModelList[i].created,
          episode: personModelList[i].episode,
        ),
      );
    }
    return newPersonList;
  }

  static Person toPerson(PersonDTO personDTO) {
    return Person(
      id: personDTO.id,
      name: personDTO.name,
      status: personDTO.status,
      species: personDTO.species,
      type: personDTO.type,
      gender: personDTO.gender,
      origin: LocationMapper.toLocation(personDTO.origin),
      image: personDTO.image,
      location: LocationMapper.toLocation(personDTO.location),
      created: personDTO.created,
      episode: personDTO.episode,
    );
  }

  static PersonHive toHiveFromPerson(Person person) {
    return PersonHive(
      id: person.id,
      name: person.name,
      status: person.status,
      species: person.species,
      type: person.type,
      gender: person.gender,
      originName: person.origin.name,
      originURL: person.origin.url,
      image: person.image,
      locationName: person.location.name,
      locationURL: person.location.url,
      created: person.created,
      episode: person.episode,
    );
  }

  static Person toPersonFromHive(PersonHive personHive) {
    return Person(
      id: personHive.id,
      name: personHive.name,
      status: personHive.status,
      species: personHive.species,
      type: personHive.type,
      gender: personHive.gender,
      origin: Location(name: personHive.originName, url: personHive.originURL),
      image: personHive.image,
      location:
          Location(name: personHive.locationName, url: personHive.locationURL),
      created: personHive.created,
      episode: personHive.episode,
    );
  }
}
