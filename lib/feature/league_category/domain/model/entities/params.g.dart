// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueAndSeasonParameters _$LeagueAndSeasonParametersFromJson(
        Map<String, dynamic> json) =>
    LeagueAndSeasonParameters(
      league: json['league'] as String,
      season: json['season'] as String,
    );

Map<String, dynamic> _$LeagueAndSeasonParametersToJson(
        LeagueAndSeasonParameters instance) =>
    <String, dynamic>{
      'league': instance.league,
      'season': instance.season,
    };

LeagueAndSeasonAndPageParameters _$LeagueAndSeasonAndPageParametersFromJson(
        Map<String, dynamic> json) =>
    LeagueAndSeasonAndPageParameters(
      league: json['league'] as String,
      season: json['season'] as String,
      page: json['page'] as String,
    );

Map<String, dynamic> _$LeagueAndSeasonAndPageParametersToJson(
        LeagueAndSeasonAndPageParameters instance) =>
    <String, dynamic>{
      'league': instance.league,
      'season': instance.season,
      'page': instance.page,
    };

TeamParams _$TeamParamsFromJson(Map<String, dynamic> json) => TeamParams(
      team: json['team'] as String,
    );

Map<String, dynamic> _$TeamParamsToJson(TeamParams instance) =>
    <String, dynamic>{
      'team': instance.team,
    };
