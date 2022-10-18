// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_scorer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailPlayerAdapter extends TypeAdapter<DetailPlayer> {
  @override
  final int typeId = 3;

  @override
  DetailPlayer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailPlayer(
      id: fields[0] as int,
      name: fields[1] as String,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      age: fields[4] as int?,
      birth: fields[5] as Birth?,
      nationality: fields[6] as String?,
      height: fields[7] as String?,
      weight: fields[8] as String?,
      injured: fields[9] as bool,
      photo: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DetailPlayer obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.birth)
      ..writeByte(6)
      ..write(obj.nationality)
      ..writeByte(7)
      ..write(obj.height)
      ..writeByte(8)
      ..write(obj.weight)
      ..writeByte(9)
      ..write(obj.injured)
      ..writeByte(10)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailPlayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BirthAdapter extends TypeAdapter<Birth> {
  @override
  final int typeId = 4;

  @override
  Birth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Birth(
      date: fields[0] as DateTime?,
      place: fields[1] as String?,
      country: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Birth obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.place)
      ..writeByte(2)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BirthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopScorer _$TopScorerFromJson(Map<String, dynamic> json) => TopScorer(
      player: DetailPlayer.fromJson(json['player'] as Map<String, dynamic>),
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopScorerToJson(TopScorer instance) => <String, dynamic>{
      'player': instance.player,
      'statistics': instance.statistics,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      team: SimpleTeam.fromJson(json['team'] as Map<String, dynamic>),
      league: SimpleLeague.fromJson(json['league'] as Map<String, dynamic>),
      games: Game.fromJson(json['games'] as Map<String, dynamic>),
      substitutes:
          Substitute.fromJson(json['substitutes'] as Map<String, dynamic>),
      shots: Shot.fromJson(json['shots'] as Map<String, dynamic>),
      goals: DetailGoal.fromJson(json['goals'] as Map<String, dynamic>),
      passes: DetailPass.fromJson(json['passes'] as Map<String, dynamic>),
      tackles: DetailTackle.fromJson(json['tackles'] as Map<String, dynamic>),
      duels: Duel.fromJson(json['duels'] as Map<String, dynamic>),
      dribbles:
          DetailDribble.fromJson(json['dribbles'] as Map<String, dynamic>),
      fouls: Foul.fromJson(json['fouls'] as Map<String, dynamic>),
      cards: Card.fromJson(json['cards'] as Map<String, dynamic>),
      penalty: Penalty.fromJson(json['penalty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'team': instance.team,
      'league': instance.league,
      'games': instance.games,
      'substitutes': instance.substitutes,
      'shots': instance.shots,
      'goals': instance.goals,
      'passes': instance.passes,
      'tackles': instance.tackles,
      'duels': instance.duels,
      'dribbles': instance.dribbles,
      'fouls': instance.fouls,
      'cards': instance.cards,
      'penalty': instance.penalty,
    };

Penalty _$PenaltyFromJson(Map<String, dynamic> json) => Penalty(
      won: json['won'] as int?,
      commited: json['commited'] as int?,
      scored: json['scored'] as int?,
      missed: json['missed'] as int?,
      saved: json['saved'] as int?,
    );

Map<String, dynamic> _$PenaltyToJson(Penalty instance) => <String, dynamic>{
      'won': instance.won,
      'commited': instance.commited,
      'scored': instance.scored,
      'missed': instance.missed,
      'saved': instance.saved,
    };

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      yellow: json['yellow'] as int?,
      yellowred: json['yellowred'] as int?,
      red: json['red'] as int?,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'yellow': instance.yellow,
      'yellowred': instance.yellowred,
      'red': instance.red,
    };

Foul _$FoulFromJson(Map<String, dynamic> json) => Foul(
      drawn: json['drawn'] as int?,
      committed: json['committed'] as int?,
    );

Map<String, dynamic> _$FoulToJson(Foul instance) => <String, dynamic>{
      'drawn': instance.drawn,
      'committed': instance.committed,
    };

DetailDribble _$DetailDribbleFromJson(Map<String, dynamic> json) =>
    DetailDribble(
      attempts: json['attempts'] as int?,
      success: json['success'] as int?,
      past: json['past'] as int?,
    );

Map<String, dynamic> _$DetailDribbleToJson(DetailDribble instance) =>
    <String, dynamic>{
      'attempts': instance.attempts,
      'success': instance.success,
      'past': instance.past,
    };

Duel _$DuelFromJson(Map<String, dynamic> json) => Duel(
      total: json['total'] as int?,
      won: json['won'] as int?,
    );

Map<String, dynamic> _$DuelToJson(Duel instance) => <String, dynamic>{
      'total': instance.total,
      'won': instance.won,
    };

DetailTackle _$DetailTackleFromJson(Map<String, dynamic> json) => DetailTackle(
      total: json['total'] as int?,
      blocks: json['blocks'] as int?,
      interceptions: json['interceptions'] as int?,
    );

Map<String, dynamic> _$DetailTackleToJson(DetailTackle instance) =>
    <String, dynamic>{
      'total': instance.total,
      'blocks': instance.blocks,
      'interceptions': instance.interceptions,
    };

DetailPass _$DetailPassFromJson(Map<String, dynamic> json) => DetailPass(
      total: json['total'] as int?,
      key: json['key'] as int?,
      accuracy: json['accuracy'] as int?,
    );

Map<String, dynamic> _$DetailPassToJson(DetailPass instance) =>
    <String, dynamic>{
      'total': instance.total,
      'key': instance.key,
      'accuracy': instance.accuracy,
    };

DetailGoal _$DetailGoalFromJson(Map<String, dynamic> json) => DetailGoal(
      total: json['total'] as int?,
      conceded: json['conceded'] as int?,
      assists: json['assists'] as int?,
      saves: json['saves'] as int?,
    );

Map<String, dynamic> _$DetailGoalToJson(DetailGoal instance) =>
    <String, dynamic>{
      'total': instance.total,
      'conceded': instance.conceded,
      'assists': instance.assists,
      'saves': instance.saves,
    };

Shot _$ShotFromJson(Map<String, dynamic> json) => Shot(
      total: json['total'] as int?,
      on: json['on'] as int?,
    );

Map<String, dynamic> _$ShotToJson(Shot instance) => <String, dynamic>{
      'total': instance.total,
      'on': instance.on,
    };

Substitute _$SubstituteFromJson(Map<String, dynamic> json) => Substitute(
      subIn: json['in'] as int?,
      out: json['out'] as int?,
      bench: json['bench'] as int?,
    );

Map<String, dynamic> _$SubstituteToJson(Substitute instance) =>
    <String, dynamic>{
      'in': instance.subIn,
      'out': instance.out,
      'bench': instance.bench,
    };

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      appearences: json['appearences'] as int?,
      lineups: json['lineups'] as int?,
      minutes: json['minutes'] as int?,
      number: json['number'] as int?,
      position: json['position'] as String?,
      rating: json['rating'] as String?,
      captain: json['captain'] as bool?,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'appearences': instance.appearences,
      'lineups': instance.lineups,
      'minutes': instance.minutes,
      'number': instance.number,
      'position': instance.position,
      'rating': instance.rating,
      'captain': instance.captain,
    };

SimpleLeague _$SimpleLeagueFromJson(Map<String, dynamic> json) => SimpleLeague(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      logo: json['logo'] as String,
      flag: json['flag'] as String,
      season: json['season'] as int,
    );

Map<String, dynamic> _$SimpleLeagueToJson(SimpleLeague instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'flag': instance.flag,
      'season': instance.season,
    };

DetailPlayer _$DetailPlayerFromJson(Map<String, dynamic> json) => DetailPlayer(
      id: json['id'] as int,
      name: json['name'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as int?,
      birth: json['birth'] == null
          ? null
          : Birth.fromJson(json['birth'] as Map<String, dynamic>),
      nationality: json['nationality'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      injured: json['injured'] as bool,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$DetailPlayerToJson(DetailPlayer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'birth': instance.birth,
      'nationality': instance.nationality,
      'height': instance.height,
      'weight': instance.weight,
      'injured': instance.injured,
      'photo': instance.photo,
    };

Birth _$BirthFromJson(Map<String, dynamic> json) => Birth(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      place: json['place'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$BirthToJson(Birth instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'place': instance.place,
      'country': instance.country,
    };
