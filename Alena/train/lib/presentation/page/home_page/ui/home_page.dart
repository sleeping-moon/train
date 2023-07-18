import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:train/presentation/util/standard_text.dart';
import 'package:train/presentation/widget/card.dart';
import 'package:train/presentation/widget/custom_app_bar.dart';

import '../../../widget/custom_nav_bar.dart';
import '../cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final HomeCubit _bloc = HomeCubit();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<HomeCubit, HomeInitial>(
        builder: (context, state) {
          _bloc.scrollController.addListener(_bloc.addPage);
          return Scaffold(
            backgroundColor: _bloc.color.background,
            body: CustomScrollView(
              slivers: <Widget> [
                myAppBar(
                  _bloc.color,
                  true,
                  context,
                () {
                    _bloc.refresh(context);
                  },
                ),
                SliverList.list(
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,//SliverList.list
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
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
                              _bloc.isFetched();
                              _bloc.findByName(text);
                            },
                          ),
                        ),
                        !state.isFetched
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: mediaQuery.size.height / 4,
                                  ),
                                  child: SpinKitSpinningLines(
                                    color: _bloc.color.titleColor,
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
                                    controller: _bloc.scrollController,
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
                  ],
                ),
              ],
            ),
            bottomNavigationBar: const CustomNavBar(selectedIndex: 0),
          );
        },
      ),
    );
  }
}
