import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main_page/ui/favorite_page.dart';
import '../../main_page/ui/history_page.dart';
import '../../main_page/ui/home_page.dart';
import '../../main_page/ui/setting_page.dart';

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

  /*{
    this._selectedIndex = selectedIndex;
    throw UnimplementedError();
  }*/

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'History',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.indigoAccent,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(
                  title: 'Lalalal',
                ),
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritePage(
                  title: 'Lalalal',
                ),
              ),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HistoryPage(
                  title: 'Lalalal',
                ),
              ),
            );
            break;
        }
      },
    );
  }
}
