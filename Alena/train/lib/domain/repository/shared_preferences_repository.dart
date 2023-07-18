import '../../presentation/util/standard_colors.dart';

abstract class SharedPreferencesRepository {
  StandardColors getTheme();
  Future<void> setTheme();
  int getFont();
  Future<void> setFont(String param);
  void setScore(int param);
  int getScore();
}
