import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'game_object.dart';

enum DinoState {
  jumping,
  running,
  dead,
}

class Dino extends GameObject {
  late String imagePath;

  final double imageWidth = 84;
  final double imageHeight = 90;
  double dispY = 0;
  double velY = 0;
  DinoState state = DinoState.running;

  @override
  Widget render() {
    return Image.asset(imagePath);
  }

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      screenSize.width / 10,
      screenSize.height / 1.75 - imageHeight - dispY,
      imageWidth.toDouble(),
      imageHeight.toDouble(),
    );
  }

  @override
  void update(Duration lastUpdate, Duration? elapsedTime) {
    double elapsedTimeSeconds;
    try {
      if ((elapsedTime!.inMilliseconds/100).floor() % 2 == 1) {
        imagePath = 'assets/images/dino_2.png';
      } else {
        imagePath = 'assets/images/dino_3.png';
      }
    } catch (_) {
      state = DinoState.running;
    }
    try {
      elapsedTimeSeconds = (elapsedTime! - lastUpdate).inMilliseconds / 1000;
    } catch (_) {
      elapsedTimeSeconds = 0;
    }
    dispY += velY * elapsedTimeSeconds;
    if (dispY <= 0) {
      dispY = 0;
      velY = 0;
      state = DinoState.running;
      //imagePath = 'assets/images/dino_2.png';
    } else {
      velY -= elapsedTimeSeconds * 1500*2;
      imagePath = 'assets/images/dino_1.png';
    }
  }

  void jump() {
    if (state != DinoState.jumping) {
      imagePath = 'assets/images/dino_1.png';
      state = DinoState.jumping;
      velY = 850 * 1.25;
    }
  }

  void die() {
    imagePath = 'assets/images/dino_4.png';
    state = DinoState.dead;
  }
}
