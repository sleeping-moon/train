import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:train/presentation/util/standard_colors.dart';
import 'data/api_service/api_service.dart';
import 'data/model/person_hive/person.dart';
import 'data/repository/person_repository_impl.dart';
import 'domain/repository/person_repository.dart';
import 'domain/usecase/favourite_usecase.dart';
import 'domain/usecase/history_usecase.dart';
import 'domain/usecase/home_usecase.dart';
import 'domain/usecase/profile_usecase.dart';
import 'domain/usecase/settings_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Injector{
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonHiveAdapter());
    await Hive.openBox<PersonHive>('history_box');
    await Hive.openBox<PersonHive>('favourite_box');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<PersonRepository>(PersonRepositoryImplDIO());
    GetIt.I.registerSingleton<ApiService>(ApiServiceImp());
    GetIt.I.registerSingleton<SharedPreferences>(preferences);
    if(preferences.getBool('theme') == false){
      GetIt.I.registerSingleton<StandardColors>(StandardColorsDark());
    }else{
      GetIt.I.registerSingleton<StandardColors>(StandardColorsLight());
    }
    GetIt.I.registerSingleton<SettingUseCase>(SettingUseCaseImp(
    ));
    GetIt.I.registerSingleton<FavouriteUseCase>(FavouriteUseCaseImp());
    GetIt.I.registerSingleton<HistoryUseCase>(HistoryUseCaseImp());
    GetIt.I.registerSingleton<HomeUseCase>(HomeUseCaseImp());
    GetIt.I.registerSingleton<ProfileUseCase>(ProfileUseCaseImp());
  }
}