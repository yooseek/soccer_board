import 'package:hive/hive.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';

class HiveConnection {
  static const String _teamBox = 'favoriteTeams';
  static const String _playerBox = 'favoritePlayers';

  Future<void> insertTeam(Team team) async {
    if(await Hive.boxExists(_teamBox)) {
      final teamBox = await Hive.openBox<Team>(_teamBox);

      if(teamBox.containsKey(team.team.id.toString())){
        return;
      }

      await teamBox.put(team.team.id.toString(), team);

      if(teamBox.isOpen) {
        await teamBox.close();
      }
    }else {
      final teamBox = await Hive.openBox<Team>(_teamBox);

      await teamBox.put(team.team.id.toString(), team);

      if(teamBox.isOpen) {
        await teamBox.close();
      }
    }
  }

  Future<void> deleteTeam(Team team) async {
    if(await Hive.boxExists(_teamBox)) {
      final teamBox = await Hive.openBox<Team>(_teamBox);

      if(!teamBox.containsKey(team.team.id.toString())){
        return;
      }

      await teamBox.delete(team.team.id.toString());

      if(teamBox.isOpen) {
        await teamBox.close();
      }
    }else {
      throw Exception('Hive Exception error');
    }
  }

  Future<List<Team>> getTeams() async {
    if(await Hive.boxExists(_teamBox)) {
      final teamBox = await Hive.openBox<Team>(_teamBox);

      final response = teamBox.values.toList();

      if(teamBox.isOpen) {
        await teamBox.close();
      }

      return response;
    }else {
      return [];
    }
  }

  Future<void> insertPlayer(DetailPlayer player) async {
    if(await Hive.boxExists(_playerBox)) {
      final playerBox = await Hive.openBox<DetailPlayer>(_playerBox);

      if(playerBox.containsKey(player.id.toString())){
        return;
      }

      await playerBox.put(player.id.toString(), player);

      if(playerBox.isOpen) {
        await playerBox.close();
      }
    }else {
      final playerBox = await Hive.openBox<DetailPlayer>(_playerBox);

      await playerBox.put(player.id.toString(), player);

      if(playerBox.isOpen) {
        await playerBox.close();
      }
    }
  }

  Future<void> deletePlayer(DetailPlayer player) async {
    if(await Hive.boxExists(_playerBox)) {
      final playerBox = await Hive.openBox<DetailPlayer>(_playerBox);

      if(!playerBox.containsKey(player.id.toString())){
        return;
      }

      await playerBox.delete(player.id.toString());

      if(playerBox.isOpen) {
        await playerBox.close();
      }
    }else {
      throw Exception('Hive Exception error');
    }
  }

  Future<List<DetailPlayer>> getPlayers() async {
    if(await Hive.boxExists(_playerBox)) {
      final playerBox = await Hive.openBox<DetailPlayer>(_playerBox);

      final response = playerBox.values.toList();

      if(playerBox.isOpen) {
        await playerBox.close();
      }

      return response;
    }else {
      return [];
    }
  }

}