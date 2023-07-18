import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:train/presentation/widget/custom_app_bar.dart';

import '../../../util/standard_text.dart';
import '../cubit/settings_cubit.dart';

class SettingsPage extends StatefulWidget {

   const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool flag = true;

  final SettingsCubit _bloc = SettingsCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<SettingsCubit, SettingsInitial>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () {
              Navigator.pop(context, flag);
              return Future.value(false);
            },
            child: Scaffold(
              backgroundColor: _bloc.color.background,
              appBar: CustomAppBar(
                goBack: () {},
                isMainPage: false,
              ),
              body: SettingsList(
                sections: [
                  SettingsSection(
                    titlePadding: const EdgeInsets.all(20),
                    title: StandardText.setting,
                    titleTextStyle: TextStyle(
                      fontSize: 35 + _bloc.font.toDouble(),
                    ),
                    tiles: [
                      SettingsTile(
                        title: StandardText.font,
                        subtitle: _bloc.state.font,
                        leading: const Icon(Icons.font_download_outlined),
                        onPressed: (BuildContext context) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: _bloc.color.background,
                                title: Text(
                                  'Font Size',
                                  style: TextStyle(
                                    color: _bloc.color.textColor,
                                    fontSize: 18 + _bloc.font.toDouble(),
                                  ),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      child: Text(
                                        StandardText.fontSmall,
                                        style: TextStyle(
                                          color: _bloc.color.textColor,
                                          fontSize: 18 + _bloc.font.toDouble(),
                                        ),
                                      ),
                                      onTap: () {
                                        flag = false;
                                        _bloc.changeFront(StandardText.fontSmall);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        StandardText.fontDefault,
                                        style: TextStyle(
                                          color: _bloc.color.textColor,
                                          fontSize: 18 + _bloc.font.toDouble(),
                                        ),
                                      ),
                                      onTap: () {
                                        flag = false;
                                        _bloc.changeFront(StandardText.fontDefault);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        StandardText.fontHuge,
                                        style: TextStyle(
                                          color: _bloc.color.textColor,
                                          fontSize: 18 + _bloc.font.toDouble(),
                                        ),
                                      ),
                                      onTap: () {
                                        flag = false;
                                        _bloc.changeFront(StandardText.fontHuge);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      StandardText.close,
                                      style: TextStyle(
                                        color: _bloc.color.textColor,
                                        fontSize: 18 + _bloc.font.toDouble(),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                      SettingsTile(
                        title: StandardText.theme,
                        subtitle: _bloc.state.theme,
                        leading: const Icon(Icons.phone_android),
                        onPressed: (BuildContext context) {
                          flag = false;
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
                      SettingsTile(
                        title: StandardText.game,
                        subtitle: StandardText.tapGame,
                        leading: const Icon(Icons.games_outlined),
                        onPressed: (BuildContext context) {
                          _bloc.toGame(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
