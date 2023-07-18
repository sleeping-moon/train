part of 'history_bloc.dart';

@immutable
abstract class HistoryState {
  final getIt = GetIt.instance;
}

class HistoryInitial extends HistoryState {
  late List<Person> items;
  late List<Person> show;
  late bool isFetched;
  final StandardColors color = GetIt.instance<SharedPreferencesRepository>().getTheme();
  final int font = GetIt.instance<SharedPreferencesRepository>().getFont();

  HistoryInitial.initstate() {
    items = [];
    show = [];
    isFetched = false;
  }

  HistoryInitial({
    required this.items,
    required this.show,
    required this.isFetched,
  });

  HistoryInitial.newShow(this.items, this.show);

  HistoryInitial copyWith({
    List<Person>? items,
    List<Person>? show,
    bool? isFetched,
  }) =>
      HistoryInitial(
        items: items ?? this.items,
        show: show ?? this.show,
        isFetched: isFetched?? this.isFetched,
      );

  factory HistoryInitial.init() => HistoryInitial(
        items: const [],
        show: const [],
        isFetched: false,
      );
}
