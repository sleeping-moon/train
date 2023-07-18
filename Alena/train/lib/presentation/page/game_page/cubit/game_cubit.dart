import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/repository/shared_preferences_repository.dart';
import '../../../../domain/usecase/game_usecase.dart';
import '../../../util/standard_colors.dart';
import '../ui/game_page.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameInitial> {
  final StandardColors color =
      GetIt.instance<SharedPreferencesRepository>().getTheme();
  final int font = GetIt.instance<SharedPreferencesRepository>().getFont();
  final _homeUseCase = GetIt.instance<GameUseCase>();
  int gravity = 2500;
  final int worlToPixelRatio = 10;
  final double initialVelocity = 30;
  double acceleration = 1;
  int dayNightOffest = 1000;
  double jumpVelocity = 850;
  late TextEditingController gravityController;
  late TextEditingController accelerationController;

  late TextEditingController jumpVelocityController;

  late TextEditingController runVelocityController;

  GameCubit() : super(GameInitial.init()) {
    _init();
    gravityController = TextEditingController(text: gravity.toString());
    accelerationController =
        TextEditingController(text: acceleration.toString());
    jumpVelocityController =
        TextEditingController(text: jumpVelocity.toString());
    runVelocityController =
        TextEditingController(text: initialVelocity.toString());
  }

  void _init() {
    var score = _homeUseCase.getScore();
    emit(
      state.copyWith(
        highScore: score,
      ),
    );
  }

  void refresh(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GamePage(),
      ),
    );
  }

  void saveScore(int newScore) {
    if (state.highScore < newScore) {
      _homeUseCase.setScore(newScore);
      emit(
        state.copyWith(highScore: newScore),
      );
    }
  }
}
