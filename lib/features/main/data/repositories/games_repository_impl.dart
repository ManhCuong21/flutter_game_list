import 'package:flutter_game_list/features/main/data/datasources/game_services.dart';
import 'package:flutter_game_list/features/main/domain/entities/game_detail.dart';
import 'package:flutter_game_list/features/main/domain/entities/games.dart';
import 'package:flutter_game_list/features/main/domain/repository/games_repository.dart';

class GamesRepositoryImpl extends GamesRepository {
  final GameService _service;

  GamesRepositoryImpl(this._service);

  @override
  Future<List<Games>> getGames() async {
    final responses = await _service.getGames();
    final listGame = responses.map((e) => e.toEntity()).toList();
    return listGame;
  }

  @override
  Future<GameDetail> getGame(int id) async {
    final game = await _service.getGame(id);
    return game.toEntity();
  }
}