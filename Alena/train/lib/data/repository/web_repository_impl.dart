import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:train/domain/essence/episode_entity.dart';

import '../../domain/essence/person_entity.dart';
import '../../domain/repository/person_repository.dart';
import '../../presentation/util/standard_url.dart';
import '../api_service/api_service.dart';
import '../model/episode_dto/episode_dto.dart';
import '../model/person_dto/person_dto.dart';
import '../model/wrapper/episode_wrapper.dart';
import '../model/wrapper/person_wrapper.dart';

class PersonRepositoryImplHTTP implements PersonRepository {
  final StandardUrl _standardUrl = GetIt.instance<StandardUrl>();

  PersonRepositoryImplHTTP();

  @override
  Future<List<Person>> getAllPerson(int page) async {
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'),
        headers: {'Content-type': 'application/json'});
    final persons = json.decode(response.body);
    List<PersonDTO> newList = (persons['results'] as List)
        .map((person) => PersonDTO.fromJson(person))
        .toList();
    return PersonShell.toPersons(newList);
  }

  @override
  Future<List<Person>> searchPerson(String name) async {
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?name=$name'),
        headers: {'Content-type': 'application/json'});
    final persons = json.decode(response.body);
    List<PersonDTO> newList = (persons['results'] as List)
        .map((person) => PersonDTO.fromJson(person))
        .toList();
    return PersonShell.toPersons(newList);
  }

  @override
  Future<List<Episode>> getEpisode(Person person) {
    // TODO: implement getEpisode
    throw UnimplementedError();
  }
}




class PersonRepositoryImplDIO implements PersonRepository {

  final StandardUrl _standardUrl = GetIt.instance<StandardUrl>();

  @override
  Future<List<Person>> getAllPerson(int page) async {
    ApiService apiService = GetIt.instance<ApiService>();
    final response = await apiService.dio.get(
      _standardUrl.apiUrlCharacter,
      queryParameters: {
        _standardUrl.queryParametersPage: page,
      },
    );
    final persons = response.data;
    List<PersonDTO> newList = (persons['results'] as List)
        .map((person) => PersonDTO.fromJson(person))
        .toList();
    return PersonShell.toPersons(newList);
  }

  @override
  Future<List<Episode>> getEpisode(Person person) async {
    ApiService apiService = GetIt.instance<ApiService>();
    List<EpisodeDTO> newListEpisode =[];
    for(int i = 0; i < person.episode.length; i++){
      print(person.episode[i]);
       final response = await apiService.dio.get(
         person.episode[i],
       );
       final episode  = response.data;
       EpisodeDTO episodeDTO = EpisodeDTO.fromJson(episode);
       newListEpisode.add(episodeDTO);
    }
    return EpisodeShell.toEpisodes(newListEpisode, person.episode);
  }

  @override
  Future<List<Person>> searchPerson(String query) async {
    ApiService apiService = GetIt.instance<ApiService>();
    final response = await apiService.dio.get(
      _standardUrl.apiUrlCharacter,
      queryParameters: {
        _standardUrl.queryParametersName: query,
      },
    );
    final persons = response.data;
    List<PersonDTO> newList = (persons['results'] as List)
        .map((person) => PersonDTO.fromJson(person))
        .toList();

    return PersonShell.toPersons(newList);
  }
}
