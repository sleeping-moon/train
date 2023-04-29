import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main_page/ui/setting_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //shadowColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/noun-dog-1324383(1) 1.svg",
            semanticsLabel: "dog",
            width: 55,
            height: 55,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Dogs',
            style: TextStyle(
              color: Colors.indigoAccent,
              fontSize: 53,
              fontFamily: "Cuprum",
            ),
          ),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: const Icon(
              Icons.brightness_high_rounded,
              color: Colors.indigoAccent,
              size: 50.0,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingPage(
                  title: 'Lalalal',
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(246, 210, 205, 100),
    );
  }
}
