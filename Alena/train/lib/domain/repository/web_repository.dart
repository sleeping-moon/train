import '../essence/episode_entity.dart';
import '../essence/person_entity.dart';

abstract class PersonRepository {
  Future<List<Person>> getAllPerson(int page);
  Future<List<Person>> searchPerson(String name);
  Future<List<Episode>> getEpisode(Person person);
}
