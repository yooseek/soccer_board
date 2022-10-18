import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/squad.dart';
import 'package:soccer_board/feature/league_category/domain/repository/competition_repository.dart';

part 'squads_event.dart';
part 'squads_state.dart';

class SquadsBloc extends Bloc<SquadsEvent, SquadsState> {
  final CompetitionRepository competitionRepository;

  SquadsBloc({required this.competitionRepository}) : super(SquadsState.initial()) {
    on<GetSquadsEvent>(_getSquadsEvent);
  }

  Future<void> _getSquadsEvent(GetSquadsEvent event, emit) async {
    emit(state.copyWith(status: SquadesStatus.loading));

    try{
      final squads = await competitionRepository.getSquads(event.team);

      final currentSquads = state.squads;

      currentSquads[event.team] = squads.response;

      emit(state.copyWith(status: SquadesStatus.loaded,squads: currentSquads));
    }catch(e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: SquadesStatus.error));
    }
  }
}
