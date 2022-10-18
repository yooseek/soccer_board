part of 'players_bloc.dart';

enum PlayersStatus {
  initial,
  empty,
  loading,
  loaded,
  error,
}

class PlayersState extends Equatable {
  final PlayersStatus status;
  final Map<String, List<TopScorer>> players;
  final List<TopScorer> filteredPlayers;

  const PlayersState({
    required this.status,
    required this.players,
    required this.filteredPlayers,
  });

  factory PlayersState.initial() {
    return PlayersState(
        status: PlayersStatus.initial, players: {}, filteredPlayers: []);
  }

  PlayersState copyWith({
    PlayersStatus? status,
    Map<String, List<TopScorer>>? players,
    List<TopScorer>? filteredPlayers,
  }) {
    return PlayersState(
      status: status ?? this.status,
      players: players ?? this.players,
      filteredPlayers: filteredPlayers ?? this.filteredPlayers,
    );
  }

  @override
  String toString() {
    return 'PlayersState{status: $status, players: $players, filteredPlayers: $filteredPlayers}';
  }

  @override
  List<Object> get props => [status, players, filteredPlayers];
}
