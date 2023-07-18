import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api_service/api_service.dart';
import '../data/model/episode_hive/episode.dart';
import '../data/model/person_hive/person.dart';
import '../data/repository/hive_repository_impl.dart';
import '../data/repository/shared_preferences_repository_impl.dart';
import '../data/repository/web_repository_impl.dart';
import '../domain/repository/hive_repository.dart';
import '../domain/repository/shared_preferences_repository.dart';
import '../domain/repository/web_repository.dart';
import '../presentation/util/standard_const.dart';

Future<void> initRepository() async {
  GetIt.I.registerSingleton<ApiService>(ApiServiceImp());
  await Hive.initFlutter();
  Hive.registerAdapter(PersonHiveAdapter());
  Hive.registerAdapter(EpisodeHiveAdapter());
  await Hive.openBox<PersonHive>(StandardConst.historyBox);
  await Hive.openBox<PersonHive>(StandardConst.favouriteBox);
  await Hive.openBox<List<EpisodeHive>>(StandardConst.boxEpisode);
  GetIt.I.registerSingleton<SharedPreferencesRepository>(
      SharedPreferencesRepositoryImpl(
    GetIt.instance<SharedPreferences>(),
  ));
  GetIt.I.registerSingleton<WebRepository>(
    WebRepositoryImplDIO(
      GetIt.instance<ApiService>(),
    ),
  );
  GetIt.I.registerSingleton<HiveRepository>(
    HiveRepositoryImpl(
      Hive.box<List<EpisodeHive>>(StandardConst.boxEpisode),
      Hive.box<PersonHive>(StandardConst.favouriteBox),
      Hive.box<PersonHive>(StandardConst.historyBox),
    ),
  );
}
