import '../../../domain/entity/episode_entity.dart';
import '../../../domain/entity/person_entity.dart';
import '../episode_dto/episode_dto.dart';
import '../episode_hive/episode.dart';

class EpisodeShell {//todo
  static List<Episode> toEpisodes(List<EpisodeDTO> episodeModelList, List<String> pass) {
    List<Episode> newEpisodeModelList = [];
    for (int i = 0; i < episodeModelList.length; i++) {
      newEpisodeModelList.add(
        Episode(
          Name: episodeModelList[i].name,
          OrderOfTheEpisode: episodeModelList[i].episode,
          Pass: pass[i],
        ),
      );
    }
    return newEpisodeModelList;
  }

  /*static Episode toEpisode(EpisodeDTO episode) {
    return Episode(
      Name: episode.name,
      OrderOfTheEpisode: episode.episode,
      Pass: episode,

    );
  }*/

  static List<EpisodeHive> toHiveFromPersonFromEpisode(List<Episode> episode,Person person) {
    List<EpisodeHive> newEpisodeList = [];
    for (int i = 0; i < episode.length; i++) {
      newEpisodeList.add( EpisodeHive(
        id: person.id,
        name: episode[i].Name,
        episode: episode[i].OrderOfTheEpisode,
        pass: episode[i].Pass,
      ));
    }
    return newEpisodeList;
  }

  static  List<Episode> fromHiveToEpisode(List<EpisodeHive> episodeHive) {
    List<Episode> newEpisodeList = [];
    for (int i = 0; i < episodeHive.length; i++){
      newEpisodeList.add( Episode(
        Name: episodeHive[i].name,
        OrderOfTheEpisode: episodeHive[i].episode,
        Pass: episodeHive[i].pass,
      ));
    }
    return newEpisodeList;
  }

}