import 'package:get_it/get_it.dart';
import 'package:train/presentation/util/standard_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/util/standard_const.dart';


class SharedPreferencesInjector{
  static Future<void> init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<SharedPreferences>(preferences);
    if(preferences.getBool(StandardConst.theme) == false){
      GetIt.I.registerSingleton<StandardColors>(StandardColorsDark());
    }else{
      GetIt.I.registerSingleton<StandardColors>(StandardColorsLight());
    }
  }
}