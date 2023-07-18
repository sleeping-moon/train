import 'package:flutter/widgets.dart';

import 'game_object.dart';


class UFO extends GameObject {
  final Offset worldLocation;
  final imagePath = 'assets/images/ufo.png';
  final imageHeight = 80;
  final imageWidth = 92;

  UFO({required this.worldLocation});

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
        (worldLocation.dx - runDistance) * 10,
        4 / 7 * screenSize.height -
            imageHeight -
            worldLocation.dy,
        imageWidth.toDouble(),
        imageHeight.toDouble());
  }

  @override
  Widget render() {
    return Image.asset( imagePath,
    );
  }

  /*@override
  void update(Duration lastUpdate, Duration elapsedTime) {
    frame = (elapsedTime.inMilliseconds / 200).floor() % 2;
  }*/
}