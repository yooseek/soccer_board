part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class ChangeFavoriteTeamEvent extends FavoriteEvent {
  final Team favoriteTeam;
  final bool isInsert;

  const ChangeFavoriteTeamEvent({
    required this.favoriteTeam,
    this.isInsert = true,
  });

  ChangeFavoriteTeamEvent copyWith({
    Team? favoriteTeam,
    bool? isInsert,
  }) {
    return ChangeFavoriteTeamEvent(
      favoriteTeam: favoriteTeam ?? this.favoriteTeam,
      isInsert: isInsert ?? this.isInsert,
    );
  }

  @override
  List<Object> get props => [favoriteTeam, isInsert];
}

class ChangeFavoritePlayerEvent extends FavoriteEvent {
  final DetailPlayer favoritePlayer;
  final bool isInsert;

  const ChangeFavoritePlayerEvent({
    required this.favoritePlayer,
    this.isInsert = true,
  });

  ChangeFavoritePlayerEvent copyWith({
    DetailPlayer? favoritePlayer,
    bool? isInsert,
  }) {
    return ChangeFavoritePlayerEvent(
      favoritePlayer: favoritePlayer ?? this.favoritePlayer,
      isInsert: isInsert ?? this.isInsert,
    );
  }

  @override
  List<Object> get props => [favoritePlayer, isInsert];
}


class InitFavoriteEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}
