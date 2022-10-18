part of 'rank_bloc.dart';

enum RankNetworkStatus {
  initial,
  empty,
  loading,
  loaded,
  error,
}

class RankState extends Equatable {
  final RankNetworkStatus status;
  final Map<String, List<Standing>> rank;

  const RankState({
    required this.status,
    required this.rank,
  });

  factory RankState.initial() {
    return RankState(status: RankNetworkStatus.initial, rank: {});
  }

  RankState copyWith({
    RankNetworkStatus? status,
    Map<String, List<Standing>>? rank,
  }) {
    return RankState(
      status: status ?? this.status,
      rank: rank ?? this.rank,
    );
  }

  @override
  String toString() {
    return 'RankState{status: $status, rank: $rank}';
  }

  @override
  List<Object?> get props => [status, rank];
}
