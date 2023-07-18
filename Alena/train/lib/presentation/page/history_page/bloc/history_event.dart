part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class SearchByNameEvent extends HistoryEvent {
  final String searchText;

  SearchByNameEvent(this.searchText);

  List<Person> mainFunction(HistoryInitial state) {
    print('SearchByNameEvent start');
    print('findByName start');
    List<Person> newshow = <Person>[];
    for (int i = 0; i < state.items.length; i++) {
      if (state.items[i].name.startsWith(searchText)) {
        newshow.add(state.items[i]);
      }
    }
    return newshow;
  }
}

class tapOnTheCardEvent extends HistoryEvent {
  final BuildContext context;
  final int index;

  tapOnTheCardEvent(this.context, this.index);

  void mainFunction(HistoryInitial state) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(thisPerson: state.items[index]),
      ),
    );
  }
}

class InitEvent extends HistoryEvent {
  InitEvent();
}
