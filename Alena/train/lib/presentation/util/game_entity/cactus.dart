import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'game_object.dart';


class Cactus extends GameObject {
  late String imagePath;
  late double imageWidth = 88;
  late double imageHeight = 94;
  final Offset worldLocation;

  Cactus({required this.worldLocation}) {
    switch (Random().nextInt(5)){
      case 0:
      imagePath = 'assets/images/cacti_group.png';
      imageWidth = 104;
      imageHeight = 100;
      break;
      case 1:
      imagePath = 'assets/images/cacti_large_1.png';
      imageWidth = 50;
      imageHeight = 100;
      break;
      case 2:
      imagePath = 'assets/images/cacti_large_2.png';
      imageWidth = 98;
      imageHeight = 100;
      break;
      case 3:
      imagePath = 'assets/images/cacti_small_1.png';
      imageWidth = 34;
      imageHeight = 70;
      break;
      case 4:
      imagePath = 'assets/images/cacti_small_2.png';
      imageWidth = 68;
      imageHeight = 70;
      break;
      case 5:
      imagePath = 'assets/images/cacti_small_3.png';
      imageWidth = 107;
      imageHeight = 70;
      break;
      default:
        imagePath = 'assets/images/cacti_group.png';
        imageWidth = 104;
        imageHeight = 100;
  }

  }

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * 10,
      screenSize.height / 1.75 - imageHeight,
      imageWidth.toDouble(),
      imageHeight.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(imagePath);
  }
}