part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {
  late Person person;

  ProfileInitial({
    required this.person,
  });

  ProfileInitial copyWith({
   Person? person,
  }) =>
      ProfileInitial(
        person: person ?? this.person,
      );

  factory ProfileInitial.init(Person thisperson) =>

      ProfileInitial(
        person:  thisperson,
      );
}
