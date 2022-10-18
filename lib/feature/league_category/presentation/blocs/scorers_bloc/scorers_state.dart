part of 'scorers_bloc.dart';

enum ScorersStatus {
  initial,
  empty,
  loading,
  loaded,
  error,
}

class ScorersState extends Equatable {
  final ScorersStatus status;
  final Map<String, List<TopScorer>> scorer;

  const ScorersState({
    required this.status,
    required this.scorer,
  });

  factory ScorersState.initial() {
    return ScorersState(status: ScorersStatus.initial, scorer: {});
  }

  ScorersState copyWith({
    ScorersStatus? status,
    Map<String, List<TopScorer>>? scorer,
  }) {
    return ScorersState(
      status: status ?? this.status,
      scorer: scorer ?? this.scorer,
    );
  }

  @override
  String toString() {
    return 'ScorersState{status: $status, scorer: $scorer}';
  }

  @override
  List<Object?> get props => [status, scorer];
}
