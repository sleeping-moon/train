import '../entity/episode_entity.dart';
import '../entity/person_entity.dart';

abstract class WebRepository {
  Future<List<Person>> getAllPerson(int page);
  Future<List<Person>> searchPerson(String name);
  Future<List<Episode>> getEpisode(Person person);
}
