import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/params.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/squad.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/standing.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/domain/model/response.dart';

part 'competition_service.g.dart';

@RestApi()
abstract class CompetitionService {
  // https://v3.football.api-sports.io
  factory CompetitionService(Dio dio, {String baseUrl}) = _CompetitionService;

  // https://v3.football.api-sports.io/teams
  @GET('/teams')
  @Headers({'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68','x-rapidapi-host' : 'v3.football.api-sports.io'})
  Future<ResponseDto<Team,LeagueAndSeasonParameters>> getTeams({
    @Queries() required LeagueAndSeasonParameters parameters,
  });

  // https://v3.football.api-sports.io/standings
  @GET('/standings')
  @Headers({'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68','x-rapidapi-host' : 'v3.football.api-sports.io'})
  Future<ResponseDto<Standing,LeagueAndSeasonParameters>> getRank({
    @Queries() required LeagueAndSeasonParameters parameters,
  });

  // https://v3.football.api-sports.io/players/squads
  @GET('/players/squads')
  @Headers({'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68','x-rapidapi-host' : 'v3.football.api-sports.io'})
  Future<ResponseDto<Squad,TeamParams>> getSquads({
    @Queries() required TeamParams parameters,
  });

  // https://v3.football.api-sports.io/players/squads
  @GET('/players/topscorers')
  @Headers({'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68','x-rapidapi-host' : 'v3.football.api-sports.io'})
  Future<ResponseDto<TopScorer,LeagueAndSeasonParameters>> getScorers({
    @Queries() required LeagueAndSeasonParameters parameters,
  });

  // https://v3.football.api-sports.io/players
  @GET('/players')
  @Headers({'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68','x-rapidapi-host' : 'v3.football.api-sports.io'})
  Future<ResponseDto<TopScorer,LeagueAndSeasonAndPageParameters>> getPlayers({
    @Queries() required LeagueAndSeasonAndPageParameters parameters,
  });
}
