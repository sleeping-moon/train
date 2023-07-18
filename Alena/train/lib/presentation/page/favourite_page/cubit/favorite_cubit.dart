import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../domain/entity/person_entity.dart';
import '../../../../domain/repository/shared_preferences_repository.dart';
import '../../../../domain/usecase/favourite_usecase.dart';
import '../../../util/standard_colors.dart';
import '../../profile_page/ui/profile_page.dart';
import '../ui/favorite_page.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteInitial> {

  final _favouriteUseCase = GetIt.instance<FavouriteUseCase>();
   final StandardColors color =  GetIt.instance<SharedPreferencesRepository>().getTheme();
   final int font  =  GetIt.instance<SharedPreferencesRepository>().getFont();
  FavoriteInitial initialState = FavoriteInitial.init();
  final textFieldController = TextEditingController();

  FavoriteCubit() : super(FavoriteInitial.init()){
    _init();
  }

  Future<void> tapOnTheCardEvent(BuildContext context, int index) async {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ProfilePage(thisPerson: state.show[index]),
      
    ).then((value) => refresh(context));
  }

  Future<void> _init() async {
    final response = await _favouriteUseCase.get();
    emit(
      state.copyWith(
        show: response,
        items: response,
        isFetched: true,
      ),
    );
  }

  Future<void> reset() async {
    isFetched();
    textFieldController.text = '';
    FavoriteInitial thisState = state;
    emit(
      state.copyWith(
        show: thisState.items,
        isFetched: true,
      ),
    );
  }

  void findByName(String searchText) {
    isFetched();
    List<Person> newShow = <Person>[];
    for (int i = 0; i < state.items.length; i++) {
      if (state.items[i].name.startsWith(searchText)) {
        newShow.add(state.items[i]);
      }
    }
    emit(
      state.copyWith(
        show: newShow,
        isFetched: true,
      ),
    );
  }

  void refresh(BuildContext context){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  FavoritePage(),
      ),
    );
  }

  void isFetched(){
    emit(
      state.copyWith(
        isFetched: false,
      ),
    );
  }
}
