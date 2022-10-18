import 'package:json_annotation/json_annotation.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/standing.dart';

part 'squad.g.dart';

@JsonSerializable()
class Squad {
  final SimpleTeam team;
  final List<Player> players;

  const Squad({
    required this.team,
    required this.players,
  });

  factory Squad.fromJson(Map<String,dynamic> json) =>
  _$SquadFromJson(json);

  Map<String, dynamic> toJson() => _$SquadToJson(this);
}

@JsonSerializable()
class Player {
  final int id;
  final String name;
  final int? age;
  final int? number;
  final String? position;
  final String photo;

  const Player({
    required this.id,
    required this.name,
    required this.age,
    required this.number,
    required this.position,
    required this.photo,
  });

  factory Player.fromJson(Map<String,dynamic> json) =>
  _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
