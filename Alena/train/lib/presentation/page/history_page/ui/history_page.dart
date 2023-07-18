import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:train/presentation/widget/custom_app_bar.dart';

import '../../../util/standard_text.dart';
import '../../../widget/card_for_history.dart';
import '../../../widget/custom_nav_bar.dart';
import '../bloc/history_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late final HistoryBloc _bloc;

  @override
  initState() {
    super.initState();
    _bloc = BlocProvider.of<HistoryBloc>(context);
    _bloc.add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocBuilder<HistoryBloc, HistoryInitial>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        backgroundColor: _bloc.state.color.background,
        appBar: CustomAppBar(
          goBack: () {
            _bloc.add(Refresh(context));
          },
          isMainPage: true,
        ),
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
                      StandardText.history,
                      style: TextStyle(
                        fontSize: 30 - _bloc.font.toDouble(),
                        color: _bloc.state.color.titleColor,
                      ),
                    ),
                    Icon(
                      Icons.library_books_outlined,
                      color: _bloc.state.color.titleColor,
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
                        color: _bloc.state.color.titleColor,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: _bloc.state.color.appBarColor,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: StandardText.search,
                  ),
                  onSubmitted: (text) {
                    _bloc.add(SearchByNameEvent(text));
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
                        color: _bloc.state.color.titleColor,
                        backgroundColor: _bloc.state.color.background,
                        onRefresh: _bloc.reset,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.show.length,
                          itemBuilder: (BuildContext context, int index) {
                            //print(state.getLength());
                            return GestureDetector(
                              onTap: () {
                                _bloc.add(TapOnTheCardEvent(context, index));
                              },
                              child: CardForHistory(
                                person: state.show[index],
                                color: _bloc.state.color,
                                font: _bloc.state.font,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavBar(selectedIndex: 2),
      ),
    );
  }
}
