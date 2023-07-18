import 'package:train/di/repository_injector.dart';
import 'package:train/di/shared_preferences_injector.dart';
import 'package:train/di/usecase_injector.dart';
import 'package:train/di/util_injector.dart';

class Injector{
  static Future<void> init() async {
    initUtil();
    await initSharedPreferences();
    await initRepository();
    initUseCase();
  }
}