import 'package:shared_preferences/shared_preferences.dart';
import 'package:train/presentation/util/standard_colors.dart';
import 'package:train/presentation/util/standard_text.dart';

import '../../domain/repository/shared_preferences_repository.dart';
import '../../presentation/util/standard_const.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {

  final SharedPreferences _preferences;

  SharedPreferencesRepositoryImpl(
    this._preferences,
  );

  @override
  int getFont() {
    final temp = _preferences.getInt(StandardConst.font);
    if (temp == null) {
      _preferences.setInt(StandardConst.font, 0);
      return 0;
    }
    return _preferences.getInt(StandardConst.font)!;
  }

  @override
  int getScore() {
    final temp = _preferences.getInt(StandardConst.score);
    if (temp == null) {
      _preferences.setInt(StandardConst.score, 0);
      return 0;
    }
    return _preferences.getInt(StandardConst.score)!;
  }

  @override
  void setScore(int param) {
      _preferences.setInt(StandardConst.score, param);
  }

  @override
  StandardColors getTheme() {
    StandardColors standardColors;
    final temp = _preferences.getBool(StandardConst.theme);
    if (temp == null) {
      _preferences.setBool(StandardConst.theme, true);
      standardColors = StandardColorsLight();
    } else {
      if (temp == false) {
        standardColors = StandardColorsDark();
      } else {
        standardColors = StandardColorsLight();
      }
    }
    return standardColors;
  }

  @override
  Future<void> setFont(String param) async {
    if (param == StandardText.fontSmall) {
      _preferences.setInt(StandardConst.font, -4);
    } else if (param == StandardText.fontHuge) {
      _preferences.setInt(StandardConst.font, 4);
    } else {
      _preferences.setInt(StandardConst.font, 0);
    }
  }

  @override
  Future<void> setTheme() async {
    bool param;
    if (_preferences.getBool(StandardConst.theme) == false) {
      param = true;
    } else {
      param = false;
    }
    _preferences.setBool(StandardConst.theme, param);
  }
}
