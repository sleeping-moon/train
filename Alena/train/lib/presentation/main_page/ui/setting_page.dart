import 'package:flutter/material.dart';
import 'package:train/presentation/utils/widgets/custom_app_bar.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SettingsList(
        sections: [
          SettingsSection(
            titlePadding: const EdgeInsets.all(20),
            title: 'Setting',
            titleTextStyle: const TextStyle(
              fontSize: 35,
              color: Colors.indigoAccent,
            ),
            tiles: [
              SettingsTile(
                title: 'Font',
                subtitle: 'Default',
                leading: const Icon(Icons.font_download_outlined),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Theme of the app',
                subtitle: 'Light',
                leading: const Icon(Icons.phone_android),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
