part of 'players_bloc.dart';

abstract class PlayersEvent extends Equatable {
  const PlayersEvent();
}

class GetPlayersEvent extends PlayersEvent {
  final String type;

  const GetPlayersEvent({
    required this.type,
  });

  GetPlayersEvent copyWith({
    String? type,
  }) {
    return GetPlayersEvent(
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [type];
}

class SearchPlayerEvent extends PlayersEvent {
  final String type;
  final String name;

  const SearchPlayerEvent({
    required this.type,
    required this.name,
  });

  SearchPlayerEvent copyWith({
    String? type,
    String? name,
  }) {
    return SearchPlayerEvent(
      type: type ?? this.type,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [type, name];
}

class ClearFilteredPlayerEvent extends PlayersEvent {
  final String type;

  const ClearFilteredPlayerEvent({
    required this.type,
  });

  ClearFilteredPlayerEvent copyWith({
    String? type,
  }) {
    return ClearFilteredPlayerEvent(
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [type];
}
