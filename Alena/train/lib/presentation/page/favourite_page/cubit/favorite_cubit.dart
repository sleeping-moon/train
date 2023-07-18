import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../domain/essence/person_entity.dart';
import '../../../../domain/repository/person_repository.dart';
import '../../../../domain/usecase/favourite_usecase.dart';
import '../../../../domain/usecase/home_usecase.dart';
import '../../profile_page/ui/profile_page.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteInitial> {
  final getIt = GetIt.instance;

  FavoriteCubit() : super(FavoriteInitial.init()){
    _init();
  }
  FavoriteInitial initialState = FavoriteInitial.init();

  void tapOnTheCardEvent(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(thisPerson:  state.items[index]),
      ),
    );
  }

  Future<void> _init() async {
    final response = await getIt<FavouriteUseCase>().get();
    emit(
      state.copyWith(
        show: response,
        items: response,
      ),
    );
  }

  Future<void> findByName(String searchText) async {
    List<Person> newshow = [];
    for (int i = 0; i < initialState.items.length; i++) {
      if (initialState.items[i].name.startsWith(searchText)) {
        newshow.add(initialState.items[i]);
      }
    }
    print(newshow.length);
    emit(FavoriteInitial.init());
  }
}
