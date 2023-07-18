part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  final List<Person> items;
  final List<Person> show;
  final bool isFetched;

  HomeInitial({
    required this.isFetched,
    required this.items,
    required this.show,
  });

  HomeInitial copyWith({
    bool? isFetched,
    List<Person>? items,
    List<Person>? show,
  }) =>
      HomeInitial(
        isFetched: isFetched ?? this.isFetched,
        items: items ?? this.items,
        show: show ?? this.show,
      );

  factory HomeInitial.init() => HomeInitial(
        items: const [],
        show: const [],
        isFetched: false,
      );
}
