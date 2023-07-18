import 'package:get_it/get_it.dart';

import '../domain/repository/hive_repository.dart';
import '../domain/repository/shared_preferences_repository.dart';
import '../domain/repository/web_repository.dart';
import '../domain/usecase/favourite_usecase.dart';
import '../domain/usecase/game_usecase.dart';
import '../domain/usecase/history_usecase.dart';
import '../domain/usecase/home_usecase.dart';
import '../domain/usecase/profile_usecase.dart';
import '../domain/usecase/settings_usecase.dart';

void initUseCase() {
  GetIt.I.registerSingleton<SettingsUseCase>(
    SettingsUseCaseImp(
      GetIt.instance<SharedPreferencesRepository>(),
      GetIt.instance<HiveRepository>(),
    ),
  );
  GetIt.I.registerSingleton<FavouriteUseCase>(
    FavouriteUseCaseImp(
      GetIt.instance<HiveRepository>(),
    ),
  );
  GetIt.I.registerSingleton<GameUseCase>(
    GameUseCaseImp(
      GetIt.instance<SharedPreferencesRepository>(),
    ),
  );
  GetIt.I.registerSingleton<HistoryUseCase>(
    HistoryUseCaseImp(
      GetIt.instance<HiveRepository>(),
    ),
  );
  GetIt.I.registerSingleton<HomeUseCase>(
    HomeUseCaseImp(
      GetIt.instance<WebRepository>(),
      GetIt.instance<HiveRepository>(),
    ),
  );
  GetIt.I.registerSingleton<ProfileUseCase>(
    ProfileUseCaseImp(
      GetIt.instance<HiveRepository>(),
      GetIt.instance<WebRepository>(),
    ),
  );
}
