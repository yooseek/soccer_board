import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/standing.dart';
import 'package:soccer_board/feature/league_category/domain/repository/competition_repository.dart';

part 'rank_event.dart';
part 'rank_state.dart';

class RankBloc extends Bloc<RankEvent, RankState> {
  final CompetitionRepository competitionRepository;

  RankBloc({required this.competitionRepository}) : super(RankState.initial()) {
    on<GetRankEvent>(_getRankEvent);
  }

  Future<void> _getRankEvent(GetRankEvent event, emit) async {
    emit(state.copyWith(status: RankNetworkStatus.loading));

    try{
      final rank = await competitionRepository.getRank(event.type);

      final currentRank = state.rank;
      currentRank[event.type] = rank.response;

      emit(state.copyWith(status: RankNetworkStatus.loaded,rank: currentRank));
    }catch(e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: RankNetworkStatus.error));
    }
  }
}
