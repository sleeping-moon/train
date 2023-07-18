import 'package:hive/hive.dart';
import 'package:train/data/model/episode_hive/episode.dart';

//part 'list_episode.g.dart';

@HiveType(typeId: 3)
class ListEpisodeHive {
  ListEpisodeHive({
    required this.id,
    required this.episode,
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  List<EpisodeHive> episode;
}