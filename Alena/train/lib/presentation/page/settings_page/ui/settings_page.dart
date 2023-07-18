import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train/presentation/util/standard_colors.dart';
import 'package:train/presentation/util/widget/custom_app_bar.dart';

import '../../../util/standard_text.dart';
import '../cubit/settings_cubit.dart';

/*class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SettingPage> createState() => _SettingPageState();
}*/

class SettingsPage extends StatelessWidget {
  final getIt = GetIt.instance<StandardColors>();
  final font = GetIt.instance<SharedPreferences>().getInt('font');

  final SettingsCubit _bloc = SettingsCubit();

  //final double _form = 5;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<SettingsCubit, SettingsInitial>(
        builder: (context, state) {
          //_bloc.init();
          return Scaffold(
              appBar: CustomAppBar(),
              body: SettingsList(
                sections: [
                  SettingsSection(
                    titlePadding: const EdgeInsets.all(20),
                    title: StandardText.setting,
                    titleTextStyle: TextStyle(
                      fontSize: 35,
                      color: getIt.textColor,
                    ),
                    tiles: [
                      SettingsTile(
                        title: StandardText.font,
                        subtitle: StandardText.fontDefault,
                        leading: const Icon(Icons.font_download_outlined),
                        onPressed: (BuildContext context) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Font Size'),
                                  content: Column(children: [
                                    GestureDetector(
                                      child: const Text('Small'),
                                      onTap: () {
                                        _bloc.changeFront('Small');
                                      },
                                    ),
                                    GestureDetector(
                                      child: const Text('Default'),
                                      onTap: () {
                                        _bloc.changeFront('Default');
                                      },
                                    ),
                                    GestureDetector(
                                      child: const Text('Huge'),
                                      onTap: () {
                                        _bloc.changeFront('Huge');
                                      },
                                    ),
                                  ],),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),)
                                  ],
                                );
                              },);
                        },
                      ),
                      SettingsTile(
                        title: StandardText.theme,
                        subtitle: _bloc.state.theme,
                        leading: const Icon(Icons.phone_android),
                        onPressed: (BuildContext context) {
                          _bloc.changeTheme();
                        },
                      ),
                      SettingsTile(
                        title: StandardText.deleteHistory,
                        subtitle: StandardText.deleteHistoryText,
                        leading: const Icon(Icons.library_books_outlined),
                        onPressed: (BuildContext context) {
                          _bloc.deleteHistory();
                        },
                      ),
                    ],
                  ),
                ],
              ),);
        },
      ),
    );
  }
}
