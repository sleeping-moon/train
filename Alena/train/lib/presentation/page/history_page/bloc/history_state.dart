part of 'history_bloc.dart';

@immutable
abstract class HistoryState {
  final getIt = GetIt.instance;
}

class HistoryInitial extends HistoryState {
  late List<Person> items;
  late List<Person> show;

  HistoryInitial.initstate() {
    items = [];
    show = [];
  }

  HistoryInitial({
    required this.items,
    required this.show,
  });

  HistoryInitial.newShow(this.items, this.show);

  HistoryInitial copyWith({
    List<Person>? items,
    List<Person>? show,
  }) =>
      HistoryInitial(
        items: items ?? this.items,
        show: show ?? this.show,
      );

  factory HistoryInitial.init() => HistoryInitial(
        items: [],
        show: [],
      );

  /*void _findByName(String searchText) {
    print('findByName start');
    List<Dog> newshow = <Dog>[];
    for (int i = 0; i < items.length; i++) {
      if (items[i].dogName.startsWith(searchText)) {
        newshow.add(items[i]);
      }
    }
    show = newshow;
  }*/
}
