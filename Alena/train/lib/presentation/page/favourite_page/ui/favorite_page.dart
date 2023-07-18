import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:train/presentation/util/widget/custom_app_bar.dart';
import 'package:train/presentation/util/widget/card.dart';

import '../../../util/standard_colors.dart';
import '../../../util/standard_text.dart';
import '../../../util/widget/custom_nav_bar.dart';
import '../cubit/favorite_cubit.dart';


class FavoritePage extends StatelessWidget {

  final FavoriteCubit _bloc = FavoriteCubit();

  final getIt = GetIt.instance<StandardColors>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<FavoriteCubit, FavoriteInitial>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 25,
                    ),
                    child: Row(
                      children: [
                        Text(
                          StandardText.favorite,
                          style: TextStyle(
                            fontSize: 30,
                            color: getIt.titleColor,
                          ),
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: getIt.titleColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: getIt.appBarColor,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: getIt.titleColor,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'Search..',
                      ),
                      onSubmitted: (text) {
                        _bloc.findByName(text);
                      },
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                        state.show.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              _bloc.tapOnTheCardEvent(context, index);
                            },
                            child: PersonCard(
                              person: state.show[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const CustomNavBar(selectedIndex: 1),
          );
        },
      ),
    );
  }
}
