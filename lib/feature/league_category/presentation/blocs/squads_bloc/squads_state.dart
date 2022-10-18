part of 'squads_bloc.dart';

enum SquadesStatus {
  initial,
  loading,
  loaded,
  error,
  complete,
}

class SquadsState extends Equatable {
  final SquadesStatus status;
  final Map<String, List<Squad>> squads;

  const SquadsState({
    required this.status,
    required this.squads,
  });

  factory SquadsState.initial() {
    return SquadsState(status: SquadesStatus.initial, squads: {});
  }

  SquadsState copyWith({
    SquadesStatus? status,
    Map<String, List<Squad>>? squads,
  }) {
    return SquadsState(
      status: status ?? this.status,
      squads: squads ?? this.squads,
    );
  }

  @override
  String toString() {
    return 'SquadsState{status: $status, squads: $squads}';
  }

  @override
  List<Object> get props => [status, squads];
}
