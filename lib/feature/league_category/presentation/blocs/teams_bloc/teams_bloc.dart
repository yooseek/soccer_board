import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/domain/repository/competition_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'teams_event.dart';
part 'teams_state.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  final CompetitionRepository competitionRepository;

  TeamsBloc({required this.competitionRepository}) : super(TeamsState.initial()) {
    on<GetTeamsEvent>(_getTeamsEvent,transformer: sequential());
  }

  Future<void> _getTeamsEvent(GetTeamsEvent event, emit) async {
    emit(state.copyWith(status: NetworkStatus.loading));

    try{
      final teams = await competitionRepository.getTeams(event.type);

      final currentTeams = state.teams;

      currentTeams[event.type] = teams.response;

      emit(state.copyWith(status: NetworkStatus.loaded,teams: currentTeams));
    }catch(e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: NetworkStatus.error));
    }
  }
}
