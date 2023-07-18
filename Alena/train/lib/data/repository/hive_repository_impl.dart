import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:train/data/model/person_hive/person.dart';
import 'package:train/domain/entity/person_entity.dart';

import '../../domain/entity/episode_entity.dart';
import '../../domain/repository/hive_repository.dart';
import '../../presentation/util/standard_const.dart';
import '../model/episode_hive/episode.dart';
import '../model/mapper/episode_mapper.dart';
import '../model/mapper/person_mapper.dart';

class HiveRepositoryImpl implements HiveRepository {

  final Box<PersonHive> _boxHistory;
  final Box<PersonHive> _boxFavourite;
  final Box<List<EpisodeHive>> _boxEpisode;


  HiveRepositoryImpl(
      this._boxEpisode,
      this._boxFavourite,
      this._boxHistory,
      );


  @override
  Future<void> addPersonToFavourite(Person person, List<Episode> episode) async {
    PersonHive personHive = PersonMapper.toHiveFromPerson(person);
    List<EpisodeHive> episodeHive = EpisodeMapper.toHiveFromPersonFromEpisode(episode, person);
    _boxFavourite.put('key_${person.id}', personHive);
    if (!_boxEpisode.containsKey('key_${person.id}')){
      _boxEpisode.put('key_${person.id}',episodeHive);
    }
  }

  @override
  Future<List<Person>> getPersonsFromFavourite() async {
    List<Person> person = [];
    for(int i = _boxFavourite.length; i > 0; i--){
      print(i);
      if(_boxFavourite.getAt(i-1) != null ) {
        person.add(PersonMapper.toPersonFromHive(_boxFavourite.getAt(i-1)!));
      }
    }
    return person;
  }

  @override
  Future<void> deletePersonFromFavourite(int param) async {
      _boxFavourite.delete('key_$param');
      //_boxFavouriteEpisode.delete('key_$param');
  }

  @override
  Future<bool> isFavourite(int param) async {
    return _boxFavourite.containsKey('key_$param');
  }

  @override
  Future<void> addPersonToHistory(Person person, List<Episode> episode) async {
    print("I'm working(rep)");
    PersonHive personHive = PersonMapper.toHiveFromPerson(person);
    List<EpisodeHive> episodeHive = EpisodeMapper.toHiveFromPersonFromEpisode(episode,person);
    _boxHistory.put('key_${DateTime.now()}', personHive);
    if (!_boxEpisode.containsKey('key_${person.id}')){
    _boxEpisode.put('key_${person.id}',episodeHive);
    }
  }



  @override
  Future<List<Person>> getPersonsFromHistory() async {
    List<Person> person = [];
    for(int i = _boxHistory.length; i > 0; i--){
      print(i);
      if(_boxHistory.getAt(i-1) != null ) {
        Person newPerson = PersonMapper.toPersonFromHive(_boxHistory.getAt(i-1)!);
        person.add(newPerson);
      }
    }
    return person;
  }

  @override
  Future<List<Episode>> getEpisode(Person person) async {
    //List<EpisodeHive>? episode = [];
    if(_boxEpisode.containsKey('key_${person.id}')){
      final episode = _boxEpisode.get('key_${person.id}', defaultValue: [])?.cast<EpisodeHive>();
     // _boxEpisode.values.toList();
      return EpisodeMapper.fromHiveToEpisode(episode!);
    }else {
      return [];
    }
  }

  @override
  Future<void> deletePersonsFromHistory() async {
    for(int i = _boxHistory.length; i >= 0; i--){
      _boxHistory.deleteAt(i-1);
     // _boxHistoryEpisode.deleteAt(i-1);
    }
  }

}