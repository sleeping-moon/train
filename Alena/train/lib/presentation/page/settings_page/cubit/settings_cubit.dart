import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../domain/repository/shared_preferences_repository.dart';
import '../../../../domain/usecase/settings_usecase.dart';
import '../../../util/standard_colors.dart';
import '../../../util/standard_text.dart';
import '../../game_page/ui/game_page.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsInitial> {
  final _settingsUseCase = GetIt.instance<SettingsUseCase>();
  final StandardColors color =
      GetIt.instance<SharedPreferencesRepository>().getTheme();
  final int font = GetIt.instance<SharedPreferencesRepository>().getFont();
  late String _theme;

  late String _thisFont;

  int _counter = 0;

  SettingsCubit() : super(SettingsInitial.init()) {
    _theme = StandardText.themeLight;
    if (color.background == const Color.fromRGBO(125, 125, 125, 20)) {
      _theme = StandardText.themeDark;
    } else {
      _theme = StandardText.themeLight;
    }
    if (font == -4) {
      _thisFont = StandardText.fontSmall;
    } else if (font == 4) {
      _thisFont = StandardText.fontHuge;
    } else {
      _thisFont = StandardText.fontDefault;
    }
    emit(
      state.copyWith(
        theme: _theme,
        font: _thisFont,
      ),
    );
  }

  void changeFront(String param) {
    _settingsUseCase.changeFont(param);
    emit(
      state.copyWith(
        font: param,
      ),
    );
  }

  void changeTheme() {
    _settingsUseCase.changeTheme();
    if (_theme == StandardText.themeDark) {
      _theme = StandardText.themeLight;
    } else {
      _theme = StandardText.themeDark;
    }
    emit(
      state.copyWith(
        theme: _theme,
      ),
    );
  }

  void deleteHistory() {
    _settingsUseCase.deleteHistory();
  }

  void toGame(BuildContext context) {
    _counter += 1;
    if (_counter >= 5) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.size,
          child: const GamePage(),
          alignment: Alignment.bottomCenter,
          duration: const Duration(milliseconds: 300),
        ),
      );
    }
    Future.delayed(
      const Duration(seconds: 3),
      () {
        _counter = 0;
      },
    );
  }
}
