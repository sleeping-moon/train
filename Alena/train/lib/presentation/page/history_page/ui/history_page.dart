import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:train/presentation/util/widget/custom_app_bar.dart';

import '../../../util/standard_colors.dart';
import '../../../util/standard_text.dart';
import '../../../util/widget/custom_nav_bar.dart';
import '../../../util/widget/card_for_history.dart';
import '../bloc/history_bloc.dart';

/*class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}*/

class HistoryPage extends StatelessWidget {

  final getIt = GetIt.instance<StandardColors>();
  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryBloc _bloc = BlocProvider.of<HistoryBloc>(context);
    _bloc.add(InitEvent());
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<HistoryBloc, HistoryInitial>(
        builder: (context, state) => Scaffold(
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
                        StandardText.history,
                        style: TextStyle(
                          fontSize: 30,
                          color: getIt.titleColor,
                        ),
                      ),
                      Icon(
                        Icons.library_books_outlined,
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
                        borderSide:  BorderSide(
                          width: 3,
                          color: getIt.titleColor,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: getIt.appBarColor,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Search..',
                    ),
                    onSubmitted: (text) {
                      _bloc.add(SearchByNameEvent(text));
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.show.length,
                    itemBuilder: (BuildContext context, int index) {
                      //print(state.getLength());
                      return GestureDetector(
                        onTap: () {
                          _bloc.add(tapOnTheCardEvent(context, index));
                        },
                        child: CardForHistory(person: state.show[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const CustomNavBar(selectedIndex: 2),
        ),
      ),
    );
  }
}
