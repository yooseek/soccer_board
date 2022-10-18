import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'team.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Team {
  @HiveField(0)
  final Detail team;
  @HiveField(1)
  final Venue venue;

  const Team({
    required this.team,
    required this.venue,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 1)
class Detail {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? code;
  @HiveField(3)
  final String country;
  @HiveField(4)
  final int founded;
  @HiveField(5)
  final bool national;
  @HiveField(6)
  final String logo;

  const Detail({
    required this.id,
    required this.name,
    this.code,
    required this.country,
    required this.founded,
    required this.national,
    required this.logo,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class Venue {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final String city;
  @HiveField(4)
  final int capacity;
  @HiveField(5)
  final String surface;
  @HiveField(6)
  final String image;

  const Venue({
    required this.id,
    required this.name,
    this.address,
    required this.city,
    required this.capacity,
    required this.surface,
    required this.image,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

  Map<String, dynamic> toJson() => _$VenueToJson(this);
}