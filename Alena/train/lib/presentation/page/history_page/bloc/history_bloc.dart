import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../domain/entity/person_entity.dart';
import '../../../../domain/repository/shared_preferences_repository.dart';
import '../../../../domain/usecase/history_usecase.dart';
import '../../../util/standard_colors.dart';
import '../../profile_page/ui/profile_page.dart';
import '../ui/history_page.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryInitial> {

  final _historyUseCase = GetIt.instance<HistoryUseCase>();
  final StandardColors color = GetIt.instance<SharedPreferencesRepository>().getTheme();
  final int font = GetIt.instance<SharedPreferencesRepository>().getFont();
  final textFieldController = TextEditingController();

  HistoryBloc() : super(HistoryInitial.initstate()) {
     on<InitEvent>((event, emit) {
       init();
    });
    on<SearchByNameEvent>((event, emit) {
      findByName(event.searchText);
    });
    on<TapOnTheCardEvent>((event, emit) {
      tapOnTheCardEvent(event.context,event.index);
    });
    on<Refresh>((event, emit) {
       refresh(event.context);
     });
  }

  Future<void> init() async {
    final response = await _historyUseCase.get();
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
    textFieldController.text='';
    HistoryInitial thisState = state;
    emit(
      state.copyWith(
        show: thisState.items,
        isFetched: true,
      ),
    );
  }

  void findByName(String searchText) {
    isFetched();
    List<Person> newshow = <Person>[];
    for (int i = 0; i < state.items.length; i++) {
      if (state.items[i].name.startsWith(searchText)) {
        newshow.add(state.items[i]);
      }
    }
    emit(
      state.copyWith(
        show: newshow,
        isFetched: true,
      ),
    );
  }

  void refresh(BuildContext context){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  const HistoryPage(),
      ),
    );
  }

  Future<void> tapOnTheCardEvent(BuildContext context, int index) async {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ProfilePage(thisPerson: state.show[index]),
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
