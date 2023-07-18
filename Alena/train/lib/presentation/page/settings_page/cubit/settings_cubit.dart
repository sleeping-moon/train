import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/usecase/settings_usecase.dart';
import '../../../util/standard_text.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsInitial> {
  final getIt = GetIt.instance;

  SettingsCubit() : super(SettingsInitial.init()) {
    String theme;
    if (getIt<SharedPreferences>().getBool('theme') == false) {
      theme = StandardText.themeDark;
    } else {
      theme = StandardText.themeLight;
    }
    emit(
      state.copyWith(
        theme: theme,
      ),
    );
  }

  void changeFront(String param) {
    getIt<SettingsUseCase>().changeFont(param);
  }

  void changeTheme() {
    bool theme;
    if (getIt<SharedPreferences>().getBool('theme') == false) {
      theme = true;
    } else {
      theme = false;
    }
    getIt<SettingsUseCase>().changeTheme(theme);
  }

  void deleteHistory() {
    print('delete');
    getIt<SettingsUseCase>().deleteHistory();
  }
}
