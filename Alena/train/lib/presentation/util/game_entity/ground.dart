import 'package:flutter/widgets.dart';

import 'game_object.dart';



class Ground extends GameObject {
  final Offset worldLocation;
  final imagePath = "assets/images/ground.png";
  final imageWidth = 2399;
  final imageHeight = 24;

  Ground({required this.worldLocation});


  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * 10,
      screenSize.height / 1.75 - imageHeight,
      imageWidth.toDouble(),
      imageHeight.toDouble(),
    );
  }


  Widget render() {
    return Image.asset(imagePath);
  }
}