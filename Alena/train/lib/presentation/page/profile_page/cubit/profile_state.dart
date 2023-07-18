part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {
  final Person person;
  final bool isFavourite;
  final bool isFetched;
  final List<Episode> episode;

  ProfileInitial({
    required this.person,
    required this.isFavourite,
    required this.isFetched,
    required this.episode,
  });

  ProfileInitial copyWith({
   Person? person,
    bool? isFavourite,
    bool? isFetched,
    List<Episode>? episode,
  }) =>
      ProfileInitial(
        person: person ?? this.person,
        isFavourite: isFavourite ?? this.isFavourite,
        isFetched: isFetched ?? this.isFetched,
        episode:  episode ?? this.episode,
      );

  factory ProfileInitial.init(Person thisPerson) =>
      ProfileInitial(
        isFavourite: false,
        isFetched: true,
        person:  thisPerson,
        episode: const [],
      );
}
