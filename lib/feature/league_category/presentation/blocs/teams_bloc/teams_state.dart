part of 'teams_bloc.dart';

enum NetworkStatus {
  initial,
  loading,
  loaded,
  error,
  complete,
}

class TeamsState extends Equatable {
  final NetworkStatus status;
  final Map<String, List<Team>> teams;

  const TeamsState({
    required this.status,
    required this.teams,
  });

  factory TeamsState.initial() {
    return TeamsState(status: NetworkStatus.initial, teams: {});
  }

  TeamsState copyWith({
    NetworkStatus? status,
    Map<String, List<Team>>? teams,
  }) {
    return TeamsState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
    );
  }

  @override
  String toString() {
    return 'TeamsState{status: $status, teams: $teams}';
  }

  @override
  List<Object> get props => [status, teams];
}
