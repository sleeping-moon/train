import '../repository/shared_preferences_repository.dart';

abstract class GameUseCase {

  void setScore(int param);

  int getScore();
}

class GameUseCaseImp implements GameUseCase {
  final SharedPreferencesRepository _sharedPreferencesRepository;

  GameUseCaseImp(
      this._sharedPreferencesRepository,
      );

  @override
  int getScore() {
   return _sharedPreferencesRepository.getScore();
  }


  @override
  void setScore(int param) {
  _sharedPreferencesRepository.setScore(param);
  }


}