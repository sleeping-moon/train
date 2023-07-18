import 'package:flutter/widgets.dart';

import 'game_object.dart';



class Cloud extends GameObject {
  final Offset worldLocation;
  final imagePath = "assets/images/cloud.png";
  final imageWidth = 92;
  final imageHeight = 27;

  Cloud({required this.worldLocation});

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * 10/ 5,
      screenSize.height / 3 - imageHeight - worldLocation.dy,
      imageWidth.toDouble(),
      imageHeight.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(imagePath);
  }
}