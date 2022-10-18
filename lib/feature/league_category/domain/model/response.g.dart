// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDto<T, P> _$ResponseDtoFromJson<T, P extends Parameters>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  P Function(Object? json) fromJsonP,
) =>
    ResponseDto<T, P>(
      get: json['get'] as String,
      parameters: fromJsonP(json['parameters']),
      errors: json['errors'] as List<dynamic>,
      results: json['results'] as int,
      paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
      response: (json['response'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ResponseDtoToJson<T, P extends Parameters>(
  ResponseDto<T, P> instance,
  Object? Function(T value) toJsonT,
  Object? Function(P value) toJsonP,
) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': toJsonP(instance.parameters),
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'response': instance.response.map(toJsonT).toList(),
    };
