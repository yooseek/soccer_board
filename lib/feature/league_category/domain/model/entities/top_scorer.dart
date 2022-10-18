import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/squad.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/standing.dart';

part 'top_scorer.g.dart';

@JsonSerializable()
class TopScorer {
  final DetailPlayer player;
  final List<Stat> statistics;

  const TopScorer({
    required this.player,
    required this.statistics,
  });

  factory TopScorer.fromJson(Map<String,dynamic> json) =>
  _$TopScorerFromJson(json);

  Map<String, dynamic> toJson() => _$TopScorerToJson(this);
}

@JsonSerializable()
class Stat {
  final SimpleTeam team;
  final SimpleLeague league;
  final Game games;
  final Substitute substitutes;
  final Shot shots;
  final DetailGoal goals;
  final DetailPass passes;
  final DetailTackle tackles;
  final Duel duels;
  final DetailDribble dribbles;
  final Foul fouls;
  final Card cards;
  final Penalty penalty;

  const Stat({
    required this.team,
    required this.league,
    required this.games,
    required this.substitutes,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
    required this.duels,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
  });

  factory Stat.fromJson(Map<String,dynamic> json) =>
  _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}

@JsonSerializable()
class Penalty {
  final int? won;
  final int? commited;
  final int? scored;
  final int? missed;
  final int? saved;

  const Penalty({
    this.won,
    this.commited,
    this.scored,
    this.missed,
    this.saved,
  });

  factory Penalty.fromJson(Map<String,dynamic> json) =>
  _$PenaltyFromJson(json);

  Map<String, dynamic> toJson() => _$PenaltyToJson(this);
}

@JsonSerializable()
class Card {
  final int? yellow;
  final int? yellowred;
  final int? red;

  const Card({
    this.yellow,
    this.yellowred,
    this.red,
  });

  factory Card.fromJson(Map<String,dynamic> json) =>
      _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);

}
@JsonSerializable()
class Foul {
  final int? drawn;
  final int? committed;

  const Foul({
    this.drawn,
    this.committed,
  });

  factory Foul.fromJson(Map<String,dynamic> json) =>
  _$FoulFromJson(json);

  Map<String, dynamic> toJson() => _$FoulToJson(this);
}

@JsonSerializable()
class DetailDribble {
  final int? attempts;
  final int? success;
  final int? past;

  const DetailDribble({
    this.attempts,
    this.success,
    this.past,
  });

  factory DetailDribble.fromJson(Map<String,dynamic> json) =>
      _$DetailDribbleFromJson(json);

  Map<String, dynamic> toJson() => _$DetailDribbleToJson(this);
}

@JsonSerializable()
class Duel {
  final int? total;
  final int? won;

  const Duel({
    this.total,
    this.won,
  });

  factory Duel.fromJson(Map<String,dynamic> json) =>
  _$DuelFromJson(json);

  Map<String, dynamic> toJson() => _$DuelToJson(this);
}

@JsonSerializable()
class DetailTackle {
  final int? total;
  final int? blocks;
  final int? interceptions;

  const DetailTackle({
    this.total,
    this.blocks,
    this.interceptions,
  });

  factory DetailTackle.fromJson(Map<String,dynamic> json) =>
      _$DetailTackleFromJson(json);

  Map<String, dynamic> toJson() => _$DetailTackleToJson(this);

}

@JsonSerializable()
class DetailPass {
  final int? total;
  final int? key;
  final int? accuracy;

  const DetailPass({
    this.total,
    this.key,
    this.accuracy,
  });

  factory DetailPass.fromJson(Map<String,dynamic> json) =>
      _$DetailPassFromJson(json);

  Map<String, dynamic> toJson() => _$DetailPassToJson(this);

}

@JsonSerializable()
class DetailGoal {
  final int? total;
  final int? conceded;
  final int? assists;
  final int? saves;

  const DetailGoal({
    this.total,
    this.conceded,
    this.assists,
    this.saves,
  });

  factory DetailGoal.fromJson(Map<String,dynamic> json) =>
  _$DetailGoalFromJson(json);

  Map<String, dynamic> toJson() => _$DetailGoalToJson(this);

}

@JsonSerializable()
class Shot {
  final int? total;
  final int? on;

  const Shot({
    this.total,
    this.on,
  });

  factory Shot.fromJson(Map<String,dynamic> json) =>
  _$ShotFromJson(json);

  Map<String, dynamic> toJson() => _$ShotToJson(this);
}

@JsonSerializable()
class Substitute {
  @JsonKey(name: 'in')
  final int? subIn;
  final int? out;
  final int? bench;

  const Substitute({
    this.subIn,
    this.out,
    this.bench,
  });

  factory Substitute.fromJson(Map<String,dynamic> json) =>
  _$SubstituteFromJson(json);

  Map<String, dynamic> toJson() => _$SubstituteToJson(this);
}

@JsonSerializable()
class Game {
  final int? appearences;
  final int? lineups;
  final int? minutes;
  final int? number;
  final String? position;
  final String? rating;
  final bool? captain;

  const Game({
    this.appearences,
    this.lineups,
    this.minutes,
    this.number,
    this.position,
    this.rating,
    this.captain,
  });

  factory Game.fromJson(Map<String,dynamic> json) =>
  _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);

}

@JsonSerializable()
class SimpleLeague {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;
  final int season;

  const SimpleLeague({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
  });

  factory SimpleLeague.fromJson(Map<String,dynamic> json) =>
  _$SimpleLeagueFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleLeagueToJson(this);

}

@JsonSerializable()
@HiveType(typeId: 3)
class DetailPlayer {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? firstName;
  @HiveField(3)
  final String? lastName;
  @HiveField(4)
  final int? age;
  @HiveField(5)
  final Birth? birth;
  @HiveField(6)
  final String? nationality;
  @HiveField(7)
  final String? height;
  @HiveField(8)
  final String? weight;
  @HiveField(9)
  final bool injured;
  @HiveField(10)
  final String photo;

  const DetailPlayer({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.birth,
    required this.nationality,
    required this.height,
    required this.weight,
    required this.injured,
    required this.photo,
  });

  factory DetailPlayer.fromJson(Map<String,dynamic> json) =>
  _$DetailPlayerFromJson(json);

  Map<String, dynamic> toJson() => _$DetailPlayerToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 4)
class Birth {
  @HiveField(0)
  final DateTime? date;
  @HiveField(1)
  final String? place;
  @HiveField(2)
  final String? country;

  const Birth({
    required this.date,
    required this.place,
    required this.country,
  });

  factory Birth.fromJson(Map<String,dynamic> json) =>
  _$BirthFromJson(json);

  Map<String, dynamic> toJson() => _$BirthToJson(this);
}