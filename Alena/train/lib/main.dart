import 'package:flutter/material.dart';

import '/presentation/main_page/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //SvgPicture.asset("assets/images/noun-dog-1324383(1)1.svg",semanticsLabel: "dog",),
      title: 'Dogs',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 201, 201),
      ),
      home: const HomePage(
        title: 'Lalalal',
      ),
    );
  }
}
