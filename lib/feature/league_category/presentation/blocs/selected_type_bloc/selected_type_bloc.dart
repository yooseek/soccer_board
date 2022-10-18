import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_type_event.dart';
part 'selected_type_state.dart';

class SelectedTypeBloc extends Bloc<SelectedTypeEvent, SelectedTypeState> {
  SelectedTypeBloc() : super(SelectedTypeState.initial()) {
    on<ChangeSelectedTypeEvent>(_changeSelectedTypeEvent);
  }

  Future<void> _changeSelectedTypeEvent(ChangeSelectedTypeEvent event, emit) async {
    emit(state.copyWith(selectedType: event.selectedType));
  }
}
