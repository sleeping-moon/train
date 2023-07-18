import '../entity/person_entity.dart';
import '../repository/hive_repository.dart';

abstract class FavouriteUseCase {
  Future<List<Person>> get();
}

class FavouriteUseCaseImp implements  FavouriteUseCase {

  final HiveRepository _hiveRepository;

  FavouriteUseCaseImp(this._hiveRepository);

  @override
  Future<List<Person>> get() async {
    return _hiveRepository.getPersonsFromFavourite();
  }
}