import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:train/domain/entity/episode_entity.dart';

import '../../domain/entity/person_entity.dart';
import '../../domain/repository/web_repository.dart';
import '../../presentation/util/standard_url.dart';
import '../api_service/api_service.dart';
import '../model/episode_dto/episode_dto.dart';
import '../model/person_dto/person_dto.dart';
import '../model/mapper/episode_mapper.dart';
import '../model/mapper/person_mapper.dart';

class WebRepositoryImplHTTP implements WebRepository {

  WebRepositoryImplHTTP();

  @override
  Future<List<Person>> getAllPerson(int page) async {
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'),
        headers: {'Content-type': 'application/json'});
    final persons = json.decode(response.body);
    List<PersonDTO> newList = (persons['results'] as List)
        .map((person) => PersonDTO.fromJson(person))
        .toList();
    return PersonMapper.toPersons(newList);
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
    return PersonMapper.toPersons(newList);
  }

  @override
  Future<List<Episode>> getEpisode(Person person) {
    // TODO: implement getEpisode
    throw UnimplementedError();
  }
}

class WebRepositoryImplDIO implements WebRepository {

  final ApiService _apiService;

  WebRepositoryImplDIO(
      this._apiService,
      );

  @override
  Future<List<Person>> getAllPerson(int page) async {
    final response = await _apiService.dio.get(
      StandardUrl.apiUrlCharacter,
      queryParameters: {
        StandardUrl.queryParametersPage: page,
      },
    );
    final persons = response.data;
    List<PersonDTO> newList = (persons['results'] as List)
        .map((person) => PersonDTO.fromJson(person))
        .toList();
    return PersonMapper.toPersons(newList);
  }

  @override
  Future<List<Episode>> getEpisode(Person person) async {
    List<EpisodeDTO> newListEpisode = [];
    for (int i = 0; i < person.episode.length; i++) {
      final response = await _apiService.dio.get(
        person.episode[i],
      );
      final episode = response.data;
      EpisodeDTO episodeDTO = EpisodeDTO.fromJson(episode);
      newListEpisode.add(episodeDTO);
    }
    return EpisodeMapper.toEpisodes(newListEpisode, person.episode);
  }

  @override
  Future<List<Person>> searchPerson(String query) async {
    final response = await _apiService.dio.get(
      StandardUrl.apiUrlCharacter,
      queryParameters: {
        StandardUrl.queryParametersName: query,
      },
    );
    final persons = response.data;
    List<PersonDTO> newList = (persons['results'] as List)
        .map((person) => PersonDTO.fromJson(person))
        .toList();

    return PersonMapper.toPersons(newList);
  }
}
