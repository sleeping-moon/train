part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  late List<Person> items;
  late List<Person> show;

  HomeInitial({
    required this.items,
    required this.show,
  });

  HomeInitial copyWith({
    List<Person>? items,
    List<Person>? show,
  }) =>
      HomeInitial(
        items: items ?? this.items,
        show: show ?? this.show,
      );

  factory HomeInitial.init() =>
      HomeInitial(
        items: [],
        show: [],
      );
}


