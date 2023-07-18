import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repository/hive_repository_impl.dart';
import '../essence/person_entity.dart';
import '../repository/hive_repository.dart';

abstract class SettingUseCase {
  Future<void> changeFont(String param);
  Future<void> changeTheme(bool theme);
  Future<void> deleteHistory();
}

class SettingUseCaseImp implements  SettingUseCase {

  static final HiveRepository _hiveRepository  = HiveRepositoryImpl('history_box') ;

  static final SharedPreferences _preferences = GetIt.instance<SharedPreferences>();

  @override
  Future<void> changeFont(String param) async {
    if(param =='Small'){
      _preferences.setInt('font', -4);
    }
    else if(param =='Default'){
      _preferences.setInt('Huge', 2);
    }
    else {
      _preferences.setInt('font', 0);
    }
  }

  @override
  Future<void> changeTheme(bool theme) async {
    _preferences.setBool('theme', theme);
  }

  @override
  Future<void> deleteHistory() async {
    print('delete UseCase');
    _hiveRepository.deletePersons();
  }

}