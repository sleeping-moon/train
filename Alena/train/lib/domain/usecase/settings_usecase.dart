import '../repository/hive_repository.dart';
import '../repository/shared_preferences_repository.dart';

abstract class SettingsUseCase {
  Future<void> changeFont(String param);

  Future<void> changeTheme();

  Future<void> getTheme();

  Future<void> deleteHistory();
}

class SettingsUseCaseImp implements SettingsUseCase {
  final HiveRepository _hiveRepository;
  final SharedPreferencesRepository _sharedPreferencesRepository;

  SettingsUseCaseImp(
    this._sharedPreferencesRepository,
    this._hiveRepository,
  );

  @override
  Future<void> changeFont(String param) async {
    _sharedPreferencesRepository.setFont(param);
  }

  @override
  Future<void> changeTheme() async {
    _sharedPreferencesRepository.setTheme();
  }

  @override
  Future<void> getTheme() async {
    _sharedPreferencesRepository.getTheme();
  }

  @override
  Future<void> deleteHistory() async {
    _hiveRepository.deletePersonsFromHistory();
  }
}
