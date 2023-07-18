import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:train/presentation/page/history_page/bloc/history_bloc.dart';
import 'package:train/presentation/page/home_page/ui/home_page.dart';
import 'package:train/presentation/util/standard_colors.dart';

import 'di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HistoryBloc>(
          create: (context) => HistoryBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

bool refreshPage = false;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final getIt = GetIt.instance<StandardColors>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        scaffoldBackgroundColor: getIt.background,
        primaryColor: const Color.fromARGB(255, 255, 201, 201),
      ),
      home: const HomePage(),
    );
  }
}
