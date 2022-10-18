part of 'teams_bloc.dart';

abstract class TeamsEvent extends Equatable {
  const TeamsEvent();
}

class GetTeamsEvent extends TeamsEvent {
  final String type;

  const GetTeamsEvent({
    required this.type,
  });

  GetTeamsEvent copyWith({
    String? type,
  }) {
    return GetTeamsEvent(
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [type];
}