part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {
  final List<Person> items;
  final List<Person> show;
  final bool isFetched;

  FavoriteInitial({
    required this.isFetched,
    required this.items,
    required this.show,
  });

  FavoriteInitial copyWith({
    bool? isFetched,
    List<Person>? items,
    List<Person>? show,
  }) =>
      FavoriteInitial(
        isFetched: isFetched ?? this.isFetched,
        items: items ?? this.items,
        show: show ?? this.show,
      );

  factory FavoriteInitial.init() => FavoriteInitial(
    items: const [],
    show: const [],
    isFetched: false,
  );
}
