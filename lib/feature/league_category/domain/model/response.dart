import 'package:json_annotation/json_annotation.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/paging.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/params.dart';

part 'response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class ResponseDto<T,P extends Parameters> {
  final String get;
  final P parameters;
  final List<dynamic> errors;
  final int results;
  final Paging paging;
  final List<T> response;

  const ResponseDto({
    required this.get,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  factory ResponseDto.fromJson(Map<String,dynamic> json, T Function(Object? json) fromJsonT, P Function(Object? json) fromJsonP,) =>
  _$ResponseDtoFromJson(json, fromJsonT, fromJsonP);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT, Object? Function(P value) toJsonP,) => _$ResponseDtoToJson(this,toJsonT,toJsonP);
}

