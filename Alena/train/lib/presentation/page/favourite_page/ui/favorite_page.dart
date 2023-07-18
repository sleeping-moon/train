import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:train/presentation/widget/card.dart';
import 'package:train/presentation/widget/custom_app_bar.dart';

import '../../../util/standard_text.dart';
import '../../../widget/custom_nav_bar.dart';
import '../cubit/favorite_cubit.dart';

class FavoritePage extends StatelessWidget {
  final FavoriteCubit _bloc = FavoriteCubit();

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return  BlocProvider(
        create: (context) => _bloc,
        child: BlocBuilder<FavoriteCubit, FavoriteInitial>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: _bloc.color.background,
              body: CustomScrollView(
                slivers: [
                  myAppBar(
                    _bloc.color,
                    true,
                    context,
                        () {
                      _bloc.refresh(context);
                    },
                  ),
                  SliverFillRemaining(
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
                                  fontSize: 30 - _bloc.font.toDouble(),
                                  color: _bloc.color.titleColor,
                                ),
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: _bloc.color.titleColor,
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
                            controller: _bloc.textFieldController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: _bloc.color.titleColor,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: _bloc.color.appBarColor,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              hintText: StandardText.search,
                            ),
                            onSubmitted: (text) {
                              _bloc.findByName(text);
                            },
                          ),
                        ),
                        !state.isFetched
                            ? SizedBox(
                             height: mediaQuery.size.height * 6.5 / 10,
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 0,
                                    ),
                                    child: SpinKitSpinningLines(
                                      color: _bloc.color.titleColor,
                                    ),
                                  ),
                                ),
                            )
                            : Expanded(
                              child: RefreshIndicator(
                                color: _bloc.color.titleColor,
                                backgroundColor: _bloc.color.background,
                                onRefresh: _bloc.reset,
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
                                          color: _bloc.color,
                                          font: _bloc.font,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: const CustomNavBar(selectedIndex: 1),
            );
          },
        ),
    );
  }
}
