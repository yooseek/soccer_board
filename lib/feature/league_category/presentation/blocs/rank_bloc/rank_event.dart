part of 'rank_bloc.dart';

abstract class RankEvent extends Equatable {
  const RankEvent();
}

class GetRankEvent extends RankEvent {
  final String type;

  const GetRankEvent({
    required this.type,
  });

  GetRankEvent copyWith({
    String? type,
  }) {
    return GetRankEvent(
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [type];
}