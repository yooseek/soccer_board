// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'squad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Squad _$SquadFromJson(Map<String, dynamic> json) => Squad(
      team: SimpleTeam.fromJson(json['team'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SquadToJson(Squad instance) => <String, dynamic>{
      'team': instance.team,
      'players': instance.players,
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int?,
      number: json['number'] as int?,
      position: json['position'] as String?,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'number': instance.number,
      'position': instance.position,
      'photo': instance.photo,
    };
