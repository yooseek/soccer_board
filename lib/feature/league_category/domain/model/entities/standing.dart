import 'package:json_annotation/json_annotation.dart';

part 'standing.g.dart';

@JsonSerializable()
class Standing {
  final League league;

  const Standing({
    required this.league,
  });

  factory Standing.fromJson(Map<String,dynamic> json) =>
  _$StandingFromJson(json);

  Map<String, dynamic> toJson() => _$StandingToJson(this);
}

@JsonSerializable()
class League {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;
  final int season;
  final List<List<Rank>> standings;

  const League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.standings,
  });

  factory League.fromJson(Map<String,dynamic> json) =>
  _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);

}

@JsonSerializable()
class Rank {
  final int rank;
  final SimpleTeam team;
  final int points;
  final int goalsDiff;
  final String? group;
  final String form;
  final String status;
  final String? description;
  final DetailRank all;
  final DetailRank home;
  final DetailRank away;
  final DateTime update;

  const Rank({
    required this.rank,
    required this.team,
    required this.points,
    required this.goalsDiff,
    this.group,
    required this.form,
    required this.status,
    this.description,
    required this.all,
    required this.home,
    required this.away,
    required this.update,
  });

  factory Rank.fromJson(Map<String,dynamic> json) =>
  _$RankFromJson(json);

  Map<String, dynamic> toJson() => _$RankToJson(this);

}

@JsonSerializable()
class SimpleTeam {
  final int id;
  final String name;
  final String logo;

  const SimpleTeam({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory SimpleTeam.fromJson(Map<String,dynamic> json) =>
  _$SimpleTeamFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleTeamToJson(this);
}

@JsonSerializable()
class DetailRank {
  final int played;
  final int win;
  final int draw;
  final int lose;
  final Goals goals;

  const DetailRank({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });

  factory DetailRank.fromJson(Map<String,dynamic> json) =>
  _$DetailRankFromJson(json);

  Map<String, dynamic> toJson() => _$DetailRankToJson(this);
}

@JsonSerializable()
class Goals {
  @JsonKey(name: 'for')
  final int score;
  final int against;

  const Goals({
    required this.score,
    required this.against,
  });

  factory Goals.fromJson(Map<String,dynamic> json) =>
  _$GoalsFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}