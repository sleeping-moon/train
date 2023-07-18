import 'package:flutter/material.dart';

abstract class StandardColors {
  final Color profileBackground = const Color.fromRGBO(255, 255, 255, 50);
  final Color navIconColor = const Color.fromRGBO(102, 102, 102, 100);
  final Color navBackground = const Color.fromRGBO(255, 255, 255, 10);
  final Color background = const Color.fromRGBO(255, 255, 255, 10);
  final Color titleColor = const Color.fromRGBO(112, 252, 106, 10);
  final Color title2Color = const Color.fromRGBO(157, 116, 177, 10);
  final Color textColor = const Color.fromRGBO(125, 125, 125, 20);
  final Color shadowColor = const Color.fromRGBO(217, 217, 217, 5);
  final Color appBarColor = const Color.fromRGBO(102, 102, 102, 100);
}

class StandardColorsLight extends StandardColors {

  @override
  final Color profileBackground = const Color.fromRGBO(255, 255, 255, 50);
  @override
  final Color navIconColor = const Color.fromRGBO(102, 102, 102, 100);
  @override
  final Color navBackground = const Color.fromRGBO(246, 246, 246, 10);
  @override
  final Color background = const Color.fromRGBO(255, 255, 255, 10);
  @override
  final Color titleColor = const Color.fromRGBO(112, 252, 106, 10);
  @override
  final Color title2Color = const Color.fromRGBO(157, 116, 177, 10);
  @override
  final Color textColor = const Color.fromRGBO(125, 125, 125, 20);
  @override
  final Color shadowColor = const Color.fromRGBO(217, 217, 217, 5);
  @override
  final Color appBarColor = const Color.fromRGBO(102, 102, 102, 100);
}

class StandardColorsDark extends StandardColors {

  @override
  final Color profileBackground = const Color.fromRGBO(125, 125, 125, 50);
  @override
  final Color navIconColor = const Color.fromRGBO(255, 255, 255, 10);
  @override
  final Color navBackground = const Color.fromRGBO(0, 0, 0, 10);
  @override
  final Color background = const Color.fromRGBO(125, 125, 125, 20);
  @override
  final Color titleColor = const Color.fromRGBO(36, 178, 50, 10);
  @override
  final Color title2Color = const Color.fromRGBO(93, 33, 140, 10);
  @override
  final Color textColor = const Color.fromRGBO(255, 255, 255, 10);
  @override
  final Color shadowColor = const Color.fromRGBO(217, 217, 217, 3);
  @override
  final Color appBarColor = const Color.fromRGBO(30, 30, 30, 100);
}
