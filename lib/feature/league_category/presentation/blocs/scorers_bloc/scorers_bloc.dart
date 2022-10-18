import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/domain/repository/competition_repository.dart';

part 'scorers_event.dart';
part 'scorers_state.dart';

class ScorersBloc extends Bloc<ScorersEvent, ScorersState> {
  final CompetitionRepository competitionRepository;

  ScorersBloc({required this.competitionRepository}) : super(ScorersState.initial()) {
    on<GetScorersEvent>(_getScorersEvent);
  }

  Future<void> _getScorersEvent(GetScorersEvent event, emit) async {
    emit(state.copyWith(status: ScorersStatus.loading));

    try{
      final scorer = await competitionRepository.getScorers(event.type);

      final currentScorer = state.scorer;
      currentScorer[event.type] = scorer.response;

      emit(state.copyWith(status: ScorersStatus.loaded,scorer: currentScorer));
    }catch(e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: ScorersStatus.error));
    }
  }
}
