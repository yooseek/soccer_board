part of 'scorers_bloc.dart';

abstract class ScorersEvent extends Equatable {
  const ScorersEvent();
}

class GetScorersEvent extends ScorersEvent {
  final String type;

  const GetScorersEvent({
    required this.type,
  });

  GetScorersEvent copyWith({
    String? type,
  }) {
    return GetScorersEvent(
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [type];
}