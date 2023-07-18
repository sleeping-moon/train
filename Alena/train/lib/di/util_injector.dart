import 'package:get_it/get_it.dart';
import 'package:train/presentation/util/standard_const.dart';
import 'package:train/presentation/util/standard_text.dart';

import '../presentation/util/standard_url.dart';

void initUtil() {
  GetIt.I.registerSingleton<StandardUrl>(StandardUrl());
}
