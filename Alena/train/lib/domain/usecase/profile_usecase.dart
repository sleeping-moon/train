import 'package:train/domain/entity/episode_entity.dart';

import '../entity/person_entity.dart';
import '../repository/hive_repository.dart';
import '../repository/web_repository.dart';

abstract class ProfileUseCase {
  void addToFavourite(Person params, List<Episode> episode);

  void deletePersonFromFavourite(int param);

  Future<bool> isFavourite(int param);

  Future<List<Episode>> getEpisode(Person person);

  Future<List<Episode>> getEpisodeFromRepository(Person person);
}

class ProfileUseCaseImp implements ProfileUseCase {
  final HiveRepository _hiveRepository;

  final WebRepository _personRepository;

  ProfileUseCaseImp(
    this._hiveRepository,
    this._personRepository,
  );

  @override
  Future<List<Episode>> getEpisode(Person person) async {
    return _hiveRepository.getEpisode(person);
  }

  @override
  Future<List<Episode>> getEpisodeFromRepository(Person person) async {
    return _personRepository.getEpisode(person);
  }

  @override
  void addToFavourite(Person params, List<Episode> episode) async {
    _hiveRepository.addPersonToFavourite(params, episode);
  }

  @override
  void deletePersonFromFavourite(int param) async {
    _hiveRepository.deletePersonFromFavourite(param);
  }

  @override
  Future<bool> isFavourite(int param) async {
    return _hiveRepository.isFavourite(param);
  }
}
