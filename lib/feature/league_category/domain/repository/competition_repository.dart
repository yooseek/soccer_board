import 'package:soccer_board/feature/league_category/domain/model/entities/params.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/squad.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/standing.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/domain/model/response.dart';

abstract class CompetitionRepository {
  Future<ResponseDto<Team,LeagueAndSeasonParameters>> getTeams(String type);

  Future<ResponseDto<Standing,LeagueAndSeasonParameters>> getRank(String type);

  Future<ResponseDto<Squad,TeamParams>> getSquads(String team);

  Future<ResponseDto<TopScorer,LeagueAndSeasonParameters>> getScorers(String type);

  Future<ResponseDto<TopScorer,LeagueAndSeasonAndPageParameters>> getPlayers(String type,String page);

  Future<List<Team>> getFavoriteTeams();
  Future<void> insertFavoriteTeam(Team team);
  Future<void> deleteFavoriteTeam(Team team);

  Future<List<DetailPlayer>> getFavoritePlayers();
  Future<void> insertFavoritePlayer(DetailPlayer player);
  Future<void> deleteFavoritePlayer(DetailPlayer player);
}