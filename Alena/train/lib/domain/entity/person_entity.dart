import 'package:equatable/equatable.dart';

import 'episode_entity.dart';
import 'location_entity.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final Location origin;
  final Location location;
  final DateTime created;
  final List<String> episode;

  const Person({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.image,
    required this.location,
    required this.created,
    required this.episode,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        image,
        location,
        created,
        episode
      ];
}
