import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../page/favourite_page/ui/favorite_page.dart';
import '../../page/history_page/ui/history_page.dart';
import '../../page/home_page/ui/home_page.dart';
import '../standard_colors.dart';
import '../standard_text.dart';

class CustomNavBar extends StatefulWidget implements PreferredSizeWidget {
  final int selectedIndex;

   const CustomNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {

  final getIt = GetIt.instance<StandardColors>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.home_outlined,
          ),
          label: StandardText.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.favorite_border,
          ),
          label: StandardText.favorite,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.library_books_outlined,
          ),
          label: StandardText.history,
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: getIt.titleColor,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>  HomePage(),
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>  FavoritePage(),
              ),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryPage(),
              ),
            );
            break;
        }
      },
    );
  }
}
