import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';

import '../../domain/repository/shared_preferences_repository.dart';
import '../page/settings_page/ui/settings_page.dart';
import '../util/standard_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() goBack;
  final bool isMainPage;

  CustomAppBar({
    super.key,
    required this.goBack,
    required this.isMainPage,
  });

  final StandardColors _color =
      GetIt.instance<SharedPreferencesRepository>().getTheme();

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: false,
      expandedHeight: 30.0,
      iconTheme: IconThemeData(
        color: _color.titleColor,
      ),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Rick and Morty',
            style: TextStyle(
              color: _color.titleColor,
              fontSize: 35,
              fontFamily: "Cuprum",
            ),
          ),
          const Spacer(),
          isMainPage
              ? IconButton(
                  padding: const EdgeInsets.only(right: 10),
                  icon: const Icon(
                    Icons.brightness_high_rounded,
                    size: 45.0,
                  ),
                  onPressed: () async {
                    var flag = await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.topToBottomJoined,
                        child: const SettingsPage(),
                        childCurrent: this,
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                    if (flag != null && !flag) {
                      goBack();
                    }
                  },
                )
              : const SizedBox(),
        ],
      ),
      backgroundColor: _color.appBarColor,
    );
  }
}

SliverAppBar myAppBar(StandardColors _color, bool isMainPage,BuildContext context, Function() goBack){
  return SliverAppBar(
    pinned: false,
    snap: false,
    floating: false,
    expandedHeight: 30.0,
    iconTheme: IconThemeData(
      color: _color.titleColor,
    ),
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Rick and Morty',
          style: TextStyle(
            color: _color.titleColor,
            fontSize: 35,
            fontFamily: "Cuprum",
          ),
        ),
        const Spacer(),
        isMainPage
            ? IconButton(
          padding: const EdgeInsets.only(right: 10),
          icon: const Icon(
            Icons.brightness_high_rounded,
            size: 45.0,
          ),
          onPressed: () async {
            var flag = await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.topToBottomJoined,
                child: const SettingsPage(),
                //childCurrent: this,
                duration: Duration(milliseconds: 300),
              ),
            );
            if (flag != null && !flag) {
              goBack();
            }
          },
        )
            : const SizedBox(),
      ],
    ),
    backgroundColor: _color.appBarColor,
  );
}
