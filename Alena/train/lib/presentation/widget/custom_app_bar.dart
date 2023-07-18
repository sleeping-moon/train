import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import '../../page/settings_page/ui/settings_page.dart';
import '../standard_colors.dart';
import '../standard_url.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  final getIt = GetIt.instance<StandardColors>();

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: getIt.titleColor,
      ),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Rick and Morty',
            style: TextStyle(
              color: getIt.titleColor,
              fontSize: 35,
              fontFamily: "Cuprum",
            ),
          ),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: const Icon(
              Icons.brightness_high_rounded,
              size: 45.0,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: getIt.appBarColor,
    );
  }
}
