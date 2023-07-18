import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/entity/episode_entity.dart';
import '../../../../domain/entity/person_entity.dart';
import '../../../../domain/repository/shared_preferences_repository.dart';
import '../../../../domain/usecase/profile_usecase.dart';
import '../../../util/standard_colors.dart';
import '../ui/profile_page.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileInitial> {
  final _profileUseCase = GetIt.instance<ProfileUseCase>();
  final StandardColors color =
      GetIt.instance<SharedPreferencesRepository>().getTheme();

  final int font = GetIt.instance<SharedPreferencesRepository>().getFont();

  ProfileCubit(Person thisPerson) : super(ProfileInitial.init(thisPerson)) {
    _init();
  }

  void addToFavourite() {
    _profileUseCase.addToFavourite(state.person, state.episode);
    emit(
      state.copyWith(
        isFavourite: true,
      ),
    );
  }

  void deletePersonFromFavourite() {
    _profileUseCase.deletePersonFromFavourite(state.person.id);
    emit(
      state.copyWith(
        isFavourite: false,
      ),
    );
  }

  Future<void> _init() async {
    final response = await _profileUseCase.isFavourite(state.person.id);
    var episode = await _profileUseCase.getEpisodeFromRepository(state.person);
    if (episode.isEmpty) {
      emit(
        state.copyWith(
          isFavourite: response,
          episode: episode,
          isFetched: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isFavourite: response,
          episode: episode,
          isFetched: false,
        ),
      );
    }
  }

  void refresh(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(thisPerson: state.person),
      ),
    );
  }
}
