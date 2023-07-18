import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';

import '../../domain/repository/shared_preferences_repository.dart';
import '../page/favourite_page/ui/favorite_page.dart';
import '../page/history_page/ui/history_page.dart';
import '../page/home_page/ui/home_page.dart';
import '../util/standard_colors.dart';
import '../util/standard_text.dart';

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
  final StandardColors _color =
      GetIt.instance<SharedPreferencesRepository>().getTheme();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: StandardText.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
          ),
          label: StandardText.favorite,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.library_books_outlined,
          ),
          label: StandardText.history,
        ),
      ],
      currentIndex: widget.selectedIndex,
      backgroundColor: _color.navBackground,
      unselectedItemColor: _color.navIconColor,
      selectedItemColor: _color.titleColor,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.size,
                child: const HomePage(),
                alignment: Alignment.bottomCenter,
                duration: Duration(milliseconds: 300),
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.size,
                child: FavoritePage(),
                alignment: Alignment.bottomCenter,
                duration: Duration(milliseconds: 300),
              ),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.size,
                child:  HistoryPage(),
                alignment: Alignment.bottomCenter,
                duration: Duration(milliseconds: 300),
              ),
            );
            break;
        }
      },
    );
  }
}
