import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../domain/entity/person_entity.dart';
import '../../../../domain/repository/shared_preferences_repository.dart';
import '../../../../domain/usecase/home_usecase.dart';
import '../../../util/standard_colors.dart';
import '../../profile_page/ui/profile_page.dart';
import '../ui/home_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeInitial> {
  final _homeUseCase = GetIt.instance<HomeUseCase>();
  final StandardColors color =
      GetIt.instance<SharedPreferencesRepository>().getTheme();
  final int font = GetIt.instance<SharedPreferencesRepository>().getFont();
  final scrollController = ScrollController();
  final scroll4Controller = PageController();
  final textFieldController = TextEditingController();
  int _page = 1;
  bool _findByName = true;

  HomeCubit() : super(HomeInitial.init()) {
    _init();
  }

  Future<void> tapOnTheCardEvent(BuildContext context, int index) async {
    _homeUseCase.addToHistory(state.show[index]);
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ProfilePage(thisPerson: state.show[index]),
      elevation:  MediaQuery.of(context).size.height * 0.7,
      expand: true,
    );
  }

  Future<void> _init() async {
    final response = await _homeUseCase.getAllPerson(_page);
    try {
      emit(
        state.copyWith(
          show: response,
          items: response,
          isFetched: true,
        ),
      );
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<void> findByName(String searchText) async {
    final response = await _homeUseCase.searchPerson(searchText);
    _findByName = false;
    emit(
      state.copyWith(
        show: response,
        isFetched: true,
      ),
    );
  }

  Future<void> reset() async {
   textFieldController.text='';
    _page = 1;
    _findByName = true;
    _init();
  }

  void isFetched() {
    emit(
      state.copyWith(
        isFetched: false,
      ),
    );
  }

  Future<void> addPage() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent && _findByName != false) {
      final response = await _homeUseCase.getAllPerson(_page + 1);
      _page = _page + 1;
      List<Person> newItems = List.from(state.items);
      newItems.addAll(response);
      emit(
        state.copyWith(
          items: newItems,
          show: newItems,
          isFetched: true,
        ),
      );
    }
  }

  void refresh(BuildContext context){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  const HomePage(),
      ),
    );
  }

  int get page {
    return _page;
  }
}
