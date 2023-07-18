part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class SearchByNameEvent extends HistoryEvent {
  final String searchText;

  SearchByNameEvent(this.searchText);
}

class TapOnTheCardEvent extends HistoryEvent {
  final BuildContext context;
  final int index;

  TapOnTheCardEvent(
    this.context,
    this.index,
  );

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

class Refresh extends HistoryEvent {
  final BuildContext context;

  Refresh(this.context);
}
