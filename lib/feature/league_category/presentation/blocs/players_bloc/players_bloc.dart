import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/domain/repository/competition_repository.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  final CompetitionRepository competitionRepository;

  PlayersBloc({required this.competitionRepository}) : super(PlayersState.initial()) {
    on<GetPlayersEvent>(_getPlayersEvent);
    on<SearchPlayerEvent>(_searchPlayerEvent);
    on<ClearFilteredPlayerEvent>(_clearFilteredPlayerEvent);
  }

  Future<void> _getPlayersEvent(GetPlayersEvent event, emit) async {
    emit(state.copyWith(status: PlayersStatus.loading));

    int currentPage = 1;

    try{
      var players = await competitionRepository.getPlayers(event.type,currentPage.toString());

      var currentPlayer = state.players;
      currentPlayer[event.type] = players.response;

      while(players.paging.total > currentPage){
        currentPage++;
        players = await competitionRepository.getPlayers(event.type,currentPage.toString());

        currentPlayer[event.type]!.addAll(players.response);
      }

      emit(state.copyWith(status: PlayersStatus.loaded,players: currentPlayer,filteredPlayers: currentPlayer[event.type]));
    }catch(e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: PlayersStatus.error));
    }
  }

  Future<void> _searchPlayerEvent(SearchPlayerEvent event,emit) async {
    final currentPlayers = state.players[event.type];

    final List<TopScorer> filteredPlayer = currentPlayers!.where((e) => e.player.name.contains(event.name)).toList();

    emit(state.copyWith(filteredPlayers: filteredPlayer));
  }

  Future<void> _clearFilteredPlayerEvent(ClearFilteredPlayerEvent event,emit) async {
    final currentPlayers = state.players[event.type];

    emit(state.copyWith(filteredPlayers: currentPlayers));
  }
}
