part of 'game_cubit.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {

  int highScore;

  GameInitial({required this.highScore});

  GameInitial copyWith({
    int? highScore,
  }) =>
      GameInitial(
        highScore: highScore ?? this.highScore,
      );

  factory GameInitial.init() =>
      GameInitial(
        highScore: 0,
      );
}
