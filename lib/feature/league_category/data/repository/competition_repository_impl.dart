import 'package:flutter/foundation.dart';
import 'package:soccer_board/core/const/data.dart';
import 'package:soccer_board/feature/league_category/data/data_source/competition_service.dart';
import 'package:soccer_board/feature/league_category/data/data_source/hive_connection.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/params.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/squad.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/standing.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/domain/model/response.dart';
import 'package:soccer_board/feature/league_category/domain/repository/competition_repository.dart';

class CompetitionRepositoryImpl implements CompetitionRepository {
  final CompetitionService competitionService;
  final HiveConnection hiveConnection;

  const CompetitionRepositoryImpl({
    required this.competitionService,
    required this.hiveConnection,
  });

  @override
  Future<ResponseDto<Team, LeagueAndSeasonParameters>> getTeams(
      String type) async {
    final leagueNum = leagueNumber[type];
    var currentSeason = 0;

    if (DateTime.now().month > 6) {
      currentSeason = DateTime.now().year;
    } else {
      currentSeason = DateTime.now().year - 1;
    }

    try {
      return await competitionService.getTeams(
          parameters: LeagueAndSeasonParameters(
              league: leagueNum.toString(), season: currentSeason.toString()));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ResponseDto<Standing, LeagueAndSeasonParameters>> getRank(
      String type) async {
    final leagueNum = leagueNumber[type];
    var currentSeason = 0;

    if (DateTime.now().month > 6) {
      currentSeason = DateTime.now().year;
    } else {
      currentSeason = DateTime.now().year - 1;
    }

    try {
      return await competitionService.getRank(
          parameters: LeagueAndSeasonParameters(
              league: leagueNum.toString(), season: currentSeason.toString()));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ResponseDto<Squad, TeamParams>> getSquads(String team) async {
    try {
      return await competitionService.getSquads(
          parameters: TeamParams(team: team));
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<ResponseDto<TopScorer, LeagueAndSeasonParameters>> getScorers(
      String type) async {
    final leagueNum = leagueNumber[type];
    var currentSeason = 0;

    if (DateTime.now().month > 6) {
      currentSeason = DateTime.now().year;
    } else {
      currentSeason = DateTime.now().year - 1;
    }

    try {
      return await competitionService.getScorers(
          parameters: LeagueAndSeasonParameters(
              league: leagueNum.toString(), season: currentSeason.toString()));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ResponseDto<TopScorer, LeagueAndSeasonAndPageParameters>> getPlayers(String type,String page) async {
    final leagueNum = leagueNumber[type];
    var currentSeason = 0;

    if (DateTime.now().month > 6) {
      currentSeason = DateTime.now().year;
    } else {
      currentSeason = DateTime.now().year - 1;
    }

    try {
      return await competitionService.getPlayers(
          parameters: LeagueAndSeasonAndPageParameters(
              league: leagueNum.toString(), season: currentSeason.toString(),page: page));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Team>> getFavoriteTeams() async {
    return await hiveConnection.getTeams();
  }

  @override
  Future<void> insertFavoriteTeam(Team team) async{
    await hiveConnection.insertTeam(team);
  }

  @override
  Future<void> deleteFavoriteTeam(Team team) async {
    await hiveConnection.deleteTeam(team);
  }

  @override
  Future<List<DetailPlayer>> getFavoritePlayers() async {
    return await hiveConnection.getPlayers();
  }

  @override
  Future<void> deleteFavoritePlayer(DetailPlayer player) async {
    await hiveConnection.deletePlayer(player);
  }

  @override
  Future<void> insertFavoritePlayer(DetailPlayer player) async {
    await hiveConnection.insertPlayer(player);
  }

}
