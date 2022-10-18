// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CompetitionService implements CompetitionService {
  _CompetitionService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseDto<Team, LeagueAndSeasonParameters>> getTeams(
      {required parameters}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(parameters.toJson());
    final _headers = <String, dynamic>{
      r'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68',
      r'x-rapidapi-host': 'v3.football.api-sports.io',
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDto<Team, LeagueAndSeasonParameters>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/teams',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDto<Team, LeagueAndSeasonParameters>.fromJson(
      _result.data!,
      (json) => Team.fromJson(json as Map<String, dynamic>),
      (json) =>
          LeagueAndSeasonParameters.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ResponseDto<Standing, LeagueAndSeasonParameters>> getRank(
      {required parameters}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(parameters.toJson());
    final _headers = <String, dynamic>{
      r'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68',
      r'x-rapidapi-host': 'v3.football.api-sports.io',
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDto<Standing, LeagueAndSeasonParameters>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/standings',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDto<Standing, LeagueAndSeasonParameters>.fromJson(
      _result.data!,
      (json) => Standing.fromJson(json as Map<String, dynamic>),
      (json) =>
          LeagueAndSeasonParameters.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ResponseDto<Squad, TeamParams>> getSquads(
      {required parameters}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(parameters.toJson());
    final _headers = <String, dynamic>{
      r'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68',
      r'x-rapidapi-host': 'v3.football.api-sports.io',
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDto<Squad, TeamParams>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/players/squads',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDto<Squad, TeamParams>.fromJson(
      _result.data!,
      (json) => Squad.fromJson(json as Map<String, dynamic>),
      (json) => TeamParams.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ResponseDto<TopScorer, LeagueAndSeasonParameters>> getScorers(
      {required parameters}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(parameters.toJson());
    final _headers = <String, dynamic>{
      r'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68',
      r'x-rapidapi-host': 'v3.football.api-sports.io',
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDto<TopScorer, LeagueAndSeasonParameters>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/players/topscorers',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDto<TopScorer, LeagueAndSeasonParameters>.fromJson(
      _result.data!,
      (json) => TopScorer.fromJson(json as Map<String, dynamic>),
      (json) =>
          LeagueAndSeasonParameters.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ResponseDto<TopScorer, LeagueAndSeasonAndPageParameters>> getPlayers(
      {required parameters}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(parameters.toJson());
    final _headers = <String, dynamic>{
      r'x-rapidapi-key': 'b4acb92ee206f3ab3346fa14e5a10e68',
      r'x-rapidapi-host': 'v3.football.api-sports.io',
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ResponseDto<TopScorer, LeagueAndSeasonAndPageParameters>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/players',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        ResponseDto<TopScorer, LeagueAndSeasonAndPageParameters>.fromJson(
      _result.data!,
      (json) => TopScorer.fromJson(json as Map<String, dynamic>),
      (json) => LeagueAndSeasonAndPageParameters.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
