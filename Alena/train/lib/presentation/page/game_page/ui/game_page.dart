import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/presentation/util/game_entity/ufo.dart';

import '../../../util/game_entity/cactus.dart';
import '../../../util/game_entity/cloud.dart';
import '../../../util/game_entity/dino.dart';
import '../../../util/game_entity/game_object.dart';
import '../../../util/game_entity/ground.dart';
import '../../../widget/custom_app_bar.dart';
import '../cubit/game_cubit.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  final GameCubit _bloc = GameCubit();

  Dino dino = Dino();
  double runVelocity = 30;
  double runDistance = 0;
  int highScore = 0;

  late AnimationController worldController;

  Duration lastUpdateCall = const Duration();

  /* List<Cactus> cacti = [Cactus(worldLocation: const Offset(200, 0))];

  List<UFO> ufo = [];*/

  List<Ground> ground = [
    Ground(worldLocation: const Offset(0, 0)),
    Ground(worldLocation: const Offset(2399 / 10, 0))
  ];

  List<Cloud> clouds = [
    Cloud(worldLocation: const Offset(100, 20)),
    Cloud(worldLocation: const Offset(200, 10)),
    Cloud(worldLocation: const Offset(350, -10)),
  ];

  List<GameObject> gameObjects = [
    Cactus(worldLocation: const Offset(200, 0)),
    Cactus(worldLocation: const Offset(400, 0)),
  ];

  @override
  void initState() {
    super.initState();
    worldController =
        AnimationController(vsync: this, duration: const Duration(days: 99));
    worldController.addListener(_update);
    worldController.forward();
    _die();
  }

  void _die() {
    _bloc.saveScore(runDistance.toInt());
    setState(
      () {
        worldController.stop();
        dino.die();
      },
    );
  }

  void _newGame() {
    setState(
      () {
        runDistance = 0;
        print('Init: ${_bloc.initialVelocity}');
        runVelocity = _bloc.initialVelocity;
        dino.state = DinoState.running;
        dino.dispY = 0;
        worldController.reset();
        lastUpdateCall = const Duration();
        /*ufo = [
          UFO(worldLocation: Offset(Random().nextDouble() + 425, 95)),
        ];

        cacti = [
          Cactus(worldLocation: const Offset(100, 0)),
          // Cactus(worldLocation: const Offset(250, 0)),
          //Cactus(worldLocation: const Offset(450, 0)),
        ];*/

        ground = [
          Ground(worldLocation: const Offset(0, 0)),
          Ground(worldLocation: const Offset(2399 / 10, 0))
        ];

        clouds = [
          Cloud(worldLocation: const Offset(100, 20)),
          Cloud(worldLocation: const Offset(200, 10)),
          Cloud(worldLocation: const Offset(350, -15)),
          Cloud(worldLocation: const Offset(500, 10)),
          Cloud(worldLocation: const Offset(550, -10)),
        ];

        gameObjects = [
          Cactus(worldLocation: const Offset(200, 0)),
        ];
        worldController.forward();
      },
    );
  }

  _update() {
    try {
      double elapsedTimeSeconds;
      dino.update(lastUpdateCall, worldController.lastElapsedDuration);
      try {
        elapsedTimeSeconds =
            (worldController.lastElapsedDuration! - lastUpdateCall)
                    .inMilliseconds /
                1000;
      } catch (_) {
        elapsedTimeSeconds = 0;
      }
      runDistance += runVelocity * elapsedTimeSeconds;
      if (runDistance < 0) runDistance = 0;
      runVelocity += _bloc.acceleration * elapsedTimeSeconds;
      Size screenSize = MediaQuery.of(context).size;
      Rect dinoRect = dino.getRect(screenSize, runDistance);
      /*for (Cactus cactus in cacti) {
        Rect obstacleRect = cactus.getRect(screenSize, runDistance);
        if (dinoRect.overlaps(obstacleRect.deflate(20))) {
          _die();
        }
        if (obstacleRect.right < 0) {
          setState(
            () {
              cacti.remove(cactus);
              cacti.add(
                Cactus(
                  worldLocation: Offset(
                    runDistance +
                        Random().nextInt(100) +
                        MediaQuery.of(context).size.width /
                            _bloc.worlToPixelRatio,
                    0,
                  ),
                ),
              );
            },
          );
        }
      }*/
      // for (GameObject gameObject in gameObjects) {
      for (int i = 0; i < gameObjects.length; i++) {
        Rect obstacleRect = gameObjects[i].getRect(screenSize, runDistance);
        if (dinoRect.overlaps(obstacleRect.deflate(25))) {
          _die();
        }
        if (obstacleRect.right < 0) {
          setState(
            () {
              gameObjects.remove(gameObjects[i]);
              switch (Random().nextInt(3)) {
                case 1:
                  gameObjects.add(
                    UFO(
                      worldLocation: Offset(
                        runDistance +
                            50 +
                            Random().nextInt(70) +
                            MediaQuery.of(context).size.width /
                                _bloc.worlToPixelRatio,
                        95,
                      ),
                    ),
                  );
                  break;
                case 2:
                  gameObjects.add(
                    Cactus(
                      worldLocation: Offset(
                        runDistance +
                            50 +
                            Random().nextInt(70) +
                            MediaQuery.of(context).size.width /
                                _bloc.worlToPixelRatio,
                        0,
                      ),
                    ),
                  );
                  break;
                case 3:
                  gameObjects.add(
                    Cactus(
                      worldLocation: Offset(
                        runDistance +
                            50 +
                            Random().nextInt(70) +
                            MediaQuery.of(context).size.width /
                                _bloc.worlToPixelRatio,
                        0,
                      ),
                    ),
                  );
                  break;
                default:
                  gameObjects.add(
                    Cactus(
                      worldLocation: Offset(
                        runDistance +
                            i * 90 +
                            Random().nextInt(50) +
                            MediaQuery.of(context).size.width /
                                _bloc.worlToPixelRatio,
                        0,
                      ),
                    ),
                  );
                  break;
              }
            },
          );
        }
      }
      for (Ground groundlet in ground) {
        if (groundlet.getRect(screenSize, runDistance).right < 0) {
          setState(
            () {
              ground.remove(groundlet);
              ground.add(
                Ground(
                  worldLocation: Offset(
                    ground.last.worldLocation.dx + 2399 / 10,
                    0,
                  ),
                ),
              );
            },
          );
        }
      }
      for (Cloud cloud in clouds) {
        if (cloud.getRect(screenSize, runDistance).right < 0) {
          setState(
            () {
              clouds.remove(cloud);
              clouds.add(
                Cloud(
                  worldLocation: Offset(
                    clouds.last.worldLocation.dx +
                        Random().nextInt(200) +
                        MediaQuery.of(context).size.width /
                            _bloc.worlToPixelRatio,
                    Random().nextInt(50) - 25.0,
                  ),
                ),
              );
            },
          );
        }
      }
      /* for (UFO ufos in ufo) {
        Rect obstacleRect = ufos.getRect(screenSize, runDistance);
        if (dinoRect.overlaps(obstacleRect.deflate(30))) {
          _die();
        }
        if (obstacleRect.right < 0) {
          setState(
            () {
              ufo.remove(ufos);
              double positionUFO = runDistance + 200 +
                  Random().nextInt(200) +
                  MediaQuery
                      .of(context)
                      .size
                      .width /
                      _bloc.worlToPixelRatio;
              print(positionUFO);
              print(cacti[0].worldLocation.dx);
              /*do {
                positionUFO = runDistance + 200 +
                    Random().nextInt(200) +
                    MediaQuery
                        .of(context)
                        .size
                        .width /
                        _bloc.worlToPixelRatio;
              }while(positionUFO > cacti[0].worldLocation.dx + 30 /*&& positionUFO != clouds[1].worldLocation.dx*/);*/
              ufo.add(
                UFO(
                  worldLocation: Offset(
                    positionUFO,
                    95,
                  ),
                ),
              );
            },
          );
        }
      }*/
      lastUpdateCall = worldController.lastElapsedDuration!;
    } catch (e) {
      //
    }
  }

  @override
  void dispose() {
    _bloc.gravityController.dispose();
    _bloc.accelerationController.dispose();
    _bloc.jumpVelocityController.dispose();
    _bloc.runVelocityController.dispose();
    worldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<Widget> children = [];
    for (GameObject object in [...clouds, ...ground, ...gameObjects, dino]) {
      children.add(
        AnimatedBuilder(
          animation: worldController,
          builder: (context, _) {
            Rect objectRect = object.getRect(screenSize, runDistance);
            return Positioned(
              left: objectRect.left,
              top: objectRect.top,
              width: objectRect.width,
              height: objectRect.height,
              child: object.render(),
            );
          },
        ),
      );
    }
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<GameCubit, GameInitial>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () {
              dino.die();
              dispose();
              Navigator.pop(context);
              return Future.value(true);
            },
            child: Scaffold(
              backgroundColor: _bloc.color.background,
              appBar: CustomAppBar(
                goBack: () {
                  _bloc.refresh(context);
                },
                isMainPage: true,
              ),
              body: AnimatedContainer(
                duration: const Duration(milliseconds: 5000),
                color: Colors.white,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (dino.state != DinoState.dead) {
                      dino.jump();
                    }
                    if (dino.state == DinoState.dead) {
                      _newGame();
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ...children,
                      AnimatedBuilder(
                        animation: worldController,
                        builder: (context, _) {
                          return Positioned(
                            left: screenSize.width  - 130,
                            top: 100,
                            child: Text(
                              'Score: ${runDistance.toInt()}',
                              style:  TextStyle(
                                color: _bloc.color.appBarColor,
                                fontFamily: 'Minecraft',
                                fontSize: 18,
                              ),
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: worldController,
                        builder: (context, _) {
                          return Positioned(
                            left: 30,
                            top: 100,
                            child: Text(
                              'High Score: ${_bloc.state.highScore}',
                              style: TextStyle(
                                color: _bloc.color.appBarColor,
                                fontFamily: 'Minecraft',
                                fontSize: 18,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
