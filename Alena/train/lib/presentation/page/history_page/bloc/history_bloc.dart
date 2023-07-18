import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../domain/essence/person_entity.dart';
import '../../../../domain/usecase/history_usecase.dart';
import '../../profile_page/ui/profile_page.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryInitial> {

  final getIt = GetIt.instance;

  HistoryBloc() : super(HistoryInitial.initstate()) {
     on<InitEvent>((event, emit) {
       _init();
    });
    on<SearchByNameEvent>((event, emit) {
      emit(HistoryInitial.newShow(
          initialState.items, event.mainFunction(initialState)));
    });
    on<tapOnTheCardEvent>((event, emit) {
      event.mainFunction(state);
      //emit(state);
    });
  }

  Future<void> _init() async {
    final response = await getIt<HistoryUseCase>().get();
    print(response.length);
    emit(
      state.copyWith(
        show: response,
        items: response,
      ),
    );
  }

  @override
  HistoryInitial get initialState => HistoryInitial.initstate();

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    print('mapEventToState start');
    yield this.initialState;
  }
}
