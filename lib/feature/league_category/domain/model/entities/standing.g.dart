// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Standing _$StandingFromJson(Map<String, dynamic> json) => Standing(
      league: League.fromJson(json['league'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StandingToJson(Standing instance) => <String, dynamic>{
      'league': instance.league,
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      logo: json['logo'] as String,
      flag: json['flag'] as String,
      season: json['season'] as int,
      standings: (json['standings'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => Rank.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'flag': instance.flag,
      'season': instance.season,
      'standings': instance.standings,
    };

Rank _$RankFromJson(Map<String, dynamic> json) => Rank(
      rank: json['rank'] as int,
      team: SimpleTeam.fromJson(json['team'] as Map<String, dynamic>),
      points: json['points'] as int,
      goalsDiff: json['goalsDiff'] as int,
      group: json['group'] as String?,
      form: json['form'] as String,
      status: json['status'] as String,
      description: json['description'] as String?,
      all: DetailRank.fromJson(json['all'] as Map<String, dynamic>),
      home: DetailRank.fromJson(json['home'] as Map<String, dynamic>),
      away: DetailRank.fromJson(json['away'] as Map<String, dynamic>),
      update: DateTime.parse(json['update'] as String),
    );

Map<String, dynamic> _$RankToJson(Rank instance) => <String, dynamic>{
      'rank': instance.rank,
      'team': instance.team,
      'points': instance.points,
      'goalsDiff': instance.goalsDiff,
      'group': instance.group,
      'form': instance.form,
      'status': instance.status,
      'description': instance.description,
      'all': instance.all,
      'home': instance.home,
      'away': instance.away,
      'update': instance.update.toIso8601String(),
    };

SimpleTeam _$SimpleTeamFromJson(Map<String, dynamic> json) => SimpleTeam(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$SimpleTeamToJson(SimpleTeam instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

DetailRank _$DetailRankFromJson(Map<String, dynamic> json) => DetailRank(
      played: json['played'] as int,
      win: json['win'] as int,
      draw: json['draw'] as int,
      lose: json['lose'] as int,
      goals: Goals.fromJson(json['goals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailRankToJson(DetailRank instance) =>
    <String, dynamic>{
      'played': instance.played,
      'win': instance.win,
      'draw': instance.draw,
      'lose': instance.lose,
      'goals': instance.goals,
    };

Goals _$GoalsFromJson(Map<String, dynamic> json) => Goals(
      score: json['for'] as int,
      against: json['against'] as int,
    );

Map<String, dynamic> _$GoalsToJson(Goals instance) => <String, dynamic>{
      'for': instance.score,
      'against': instance.against,
    };
