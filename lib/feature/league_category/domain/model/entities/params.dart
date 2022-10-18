import 'package:json_annotation/json_annotation.dart';

part 'params.g.dart';

@JsonSerializable()
class LeagueAndSeasonParameters implements Parameters{
  final String league;
  final String season;

  const LeagueAndSeasonParameters({
    required this.league,
    required this.season,
  });

  factory LeagueAndSeasonParameters.fromJson(Map<String,dynamic> json) =>
      _$LeagueAndSeasonParametersFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueAndSeasonParametersToJson(this);
}


@JsonSerializable()
class LeagueAndSeasonAndPageParameters implements Parameters{
  final String league;
  final String season;
  final String page;

  const LeagueAndSeasonAndPageParameters({
    required this.league,
    required this.season,
    required this.page,
  });

  factory LeagueAndSeasonAndPageParameters.fromJson(Map<String,dynamic> json) =>
      _$LeagueAndSeasonAndPageParametersFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueAndSeasonAndPageParametersToJson(this);
}


@JsonSerializable()
class TeamParams implements Parameters{
  final String team;

  const TeamParams({
    required this.team,
  });

  factory TeamParams.fromJson(Map<String,dynamic> json) =>
      _$TeamParamsFromJson(json);

  Map<String, dynamic> toJson() => _$TeamParamsToJson(this);
}

abstract class Parameters {}