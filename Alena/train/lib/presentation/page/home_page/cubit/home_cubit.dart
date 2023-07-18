import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import '../../../../domain/essence/person_entity.dart';
import '../../../../domain/repository/person_repository.dart';
import '../../../../domain/usecase/home_usecase.dart';
import '../../profile_page/ui/profile_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeInitial> {

  final getIt = GetIt.instance;

  HomeCubit() : super(HomeInitial.init()){
    _init();
  }
  //HomeInitial initialState = HomeInitial.init();

  void tapOnTheCardEvent(BuildContext context, int index) {
    print(state.show[index]);
    getIt<HomeUseCase>().addToHistory(state.show[index]);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(thisPerson: state.show[index]),
      ),
    );
  }

   Future<void> _init() async {
    final response = await getIt<HomeUseCase>().getAllPerson(1);
    print('__________________________________________________________________________________________________________________');
    emit(
      state.copyWith(
        show: response,
        items: response,
      ),
    );
  }

  Future<void> findByName(String searchText) async {
    final response = await getIt<HomeUseCase>().searchPerson(searchText);
    state.copyWith(
      show: response,
    );
  }
}
