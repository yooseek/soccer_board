part of 'squads_bloc.dart';

abstract class SquadsEvent extends Equatable {
  const SquadsEvent();
}

class GetSquadsEvent extends SquadsEvent {
  final String team;

  const GetSquadsEvent({
    required this.team,
  });

  GetSquadsEvent copyWith({
    String? team,
  }) {
    return GetSquadsEvent(
      team: team ?? this.team,
    );
  }

  @override
  List<Object> get props => [team];
}