import '../../presentation/util/standard_colors.dart';

abstract class PersonRepository {
  Future<StandardColors> getTheme(int page);
  Future<StandardColors> setTheme(int page);
  Future<StandardColors> getFont(int page);
  Future<StandardColors> getFont(int page);
}
