part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<Team> favoriteTeams;
  final List<DetailPlayer> favoritePlayers;

  const FavoriteState({
    required this.favoriteTeams,
    required this.favoritePlayers,
  });

  factory FavoriteState.initial() {
    return FavoriteState(favoriteTeams: [], favoritePlayers: []);
  }

  FavoriteState copyWith({
    List<Team>? favoriteTeams,
    List<DetailPlayer>? favoritePlayers,
  }) {
    return FavoriteState(
      favoriteTeams: favoriteTeams ?? this.favoriteTeams,
      favoritePlayers: favoritePlayers ?? this.favoritePlayers,
    );
  }

  @override
  String toString() {
    return 'FavoriteState{favoriteTeams: $favoriteTeams, favoritePlayers: $favoritePlayers}';
  }

  @override
  List<Object> get props => [favoriteTeams, favoritePlayers];
}