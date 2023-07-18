import '../entity/person_entity.dart';
import '../repository/hive_repository.dart';
import '../repository/web_repository.dart';

abstract class HomeUseCase {
  Future<List<Person>> getAllPerson(int params);

  Future<List<Person>> searchPerson(String name);

  void addToHistory(Person params);
}

class HomeUseCaseImp implements HomeUseCase {
  final WebRepository _personRepository;

  final HiveRepository _hiveRepository;

  HomeUseCaseImp(
    this._personRepository,
    this._hiveRepository,
  );

  @override
  Future<List<Person>> getAllPerson(int page) async {
    return await _personRepository.getAllPerson(page);
  }

  @override
  Future<List<Person>> searchPerson(String name) async {
    return await _personRepository.searchPerson(name);
  }

  @override
  void addToHistory(Person params) async {
    print("I'm working(use_case)");
    final response = await _personRepository.getEpisode(params);
    print(response);
    _hiveRepository.addPersonToHistory(params, response);
  }
}
