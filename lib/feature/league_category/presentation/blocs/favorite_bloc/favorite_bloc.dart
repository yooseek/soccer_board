import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/domain/repository/competition_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final CompetitionRepository competitionRepository;

  FavoriteBloc({required this.competitionRepository})
      : super(FavoriteState.initial()) {
    on<ChangeFavoriteTeamEvent>(_changeFavoriteTeamEvent);
    on<ChangeFavoritePlayerEvent>(_changeFavoritePlayerEvent);
    on<InitFavoriteEvent>(_initFavoriteEvent);
  }

  Future<void> _changeFavoriteTeamEvent(
      ChangeFavoriteTeamEvent event, emit) async {
    // 삭제
    if (!event.isInsert) {
      if (state.favoriteTeams
          .where((element) => element.team.id == event.favoriteTeam.team.id)
          .isEmpty) {
        return;
      }

      final currentFavoriteTeams = state.favoriteTeams;

      final List<Team> newFavoriteTeams = currentFavoriteTeams.where((element){
        if(element.team.id == event.favoriteTeam.team.id) {
          return false;
        }
        return true;
      }).toList();

      emit(state.copyWith(favoriteTeams: newFavoriteTeams));
      await competitionRepository.deleteFavoriteTeam(event.favoriteTeam);

      return;
    }

    // 삽입
    // 중복 확인
    if (state.favoriteTeams
        .where((element) => element.team.id == event.favoriteTeam.team.id)
        .isNotEmpty) {
      return;
    }
    final currentFavoriteTeams = state.favoriteTeams;

    final newFavoriteTeams = [...currentFavoriteTeams, event.favoriteTeam];

    emit(state.copyWith(favoriteTeams: newFavoriteTeams));
    await competitionRepository.insertFavoriteTeam(event.favoriteTeam);
  }

  Future<void> _changeFavoritePlayerEvent(
      ChangeFavoritePlayerEvent event, emit) async {
    // 삭제
    if (!event.isInsert) {
      if (state.favoritePlayers
          .where((element) => element.id == event.favoritePlayer.id)
          .isEmpty) {
        return;
      }

      final currentFavoritePlayers = state.favoritePlayers;

      final List<DetailPlayer> newFavoritePlayers = currentFavoritePlayers.where((element){
        if(element.id == event.favoritePlayer.id) {
          return false;
        }
        return true;
      }).toList();

      emit(state.copyWith(favoritePlayers: newFavoritePlayers));
      await competitionRepository.deleteFavoritePlayer(event.favoritePlayer);

      return;
    }

    // 삽입
    // 중복 확인
    if (state.favoritePlayers
        .where((element) => element.id == event.favoritePlayer.id)
        .isNotEmpty) {
      return;
    }
    final currentFavoritePlayers = state.favoritePlayers;

    final newFavoritePlayers = [...currentFavoritePlayers, event.favoritePlayer];

    emit(state.copyWith(favoritePlayers: newFavoritePlayers));
    await competitionRepository.insertFavoritePlayer(event.favoritePlayer);
  }

  Future<void> _initFavoriteEvent(InitFavoriteEvent event, emit) async {
    final favoriteTeams = await competitionRepository.getFavoriteTeams();
    final favoritePlayers = await competitionRepository.getFavoritePlayers();

    emit(state.copyWith(favoriteTeams: favoriteTeams,favoritePlayers: favoritePlayers));
  }
}
