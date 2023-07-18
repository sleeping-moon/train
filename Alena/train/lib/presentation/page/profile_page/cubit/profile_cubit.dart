import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../domain/essence/person_entity.dart';
import '../../../../domain/usecase/profile_usecase.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileInitial> {

  final getIt = GetIt.instance;

  ProfileCubit(Person thisPerson) : super(ProfileInitial.init(thisPerson)){
  }

  void addToFavourite() {
    getIt<ProfileUseCase>().addToFavourite(state.person);
  }
}
