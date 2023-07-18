part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {
  late List<Person> items;
  late List<Person> show;

  FavoriteInitial({
    required this.items,
    required this.show,
  });

  FavoriteInitial copyWith({
    List<Person>? items,
    List<Person>? show,
  }) =>
      FavoriteInitial(
        items: items ?? this.items,
        show: show ?? this.show,
      );

  factory FavoriteInitial.init() => FavoriteInitial(
        items: [],
        show: [],
      );
}
