import 'package:flutter_game_list/features/main/domain/entities/game_detail.dart';
import 'package:flutter_game_list/features/main/domain/entities/games.dart';

abstract class GamesRepository {
  Future<List<Games>> getGames();

  Future<GameDetail> getGame(int id);
}