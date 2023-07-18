import '../entity/person_entity.dart';
import '../repository/hive_repository.dart';

abstract class HistoryUseCase {
  Future<List<Person>> get();
}

class HistoryUseCaseImp implements  HistoryUseCase {

  final HiveRepository _hiveRepository;

  HistoryUseCaseImp(this._hiveRepository);

  @override
  Future<List<Person>> get() async {
    return _hiveRepository.getPersonsFromHistory();
  }
}