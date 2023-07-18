import '../entity/episode_entity.dart';
import '../entity/person_entity.dart';

abstract class HiveRepository {
  Future<List<Person>> getPersonsFromHistory();
  Future<void> addPersonToHistory(Person person, List<Episode> episode);
  Future<void> deletePersonsFromHistory();
  Future<List<Person>> getPersonsFromFavourite();
  Future<void> addPersonToFavourite(Person person, List<Episode> episode);
  Future<void> deletePersonFromFavourite(int param);
  Future<bool> isFavourite(int param);
  Future<List<Episode>> getEpisode(Person person);
}