import 'package:hive/hive.dart';

part 'episode.g.dart';

@HiveType(typeId: 2)
class EpisodeHive {
  EpisodeHive({
    required this.id,
    required this.name,
    required this.episode,
    required this.pass,
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String episode;

  @HiveField(3)
  String pass;

}