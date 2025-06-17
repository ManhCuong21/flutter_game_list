import 'package:flutter_game_list/features/main/domain/entities/game_detail.dart';
import 'package:flutter_game_list/features/main/domain/repository/games_repository.dart';

import '../../../../core/network/api/api_result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/games.dart';

class GameUseCase implements NoInputUseCase<dynamic> {
  final GamesRepository gamesRepository;

  const GameUseCase(this.gamesRepository);

  @override
  Future<ApiResult<List<Games>>> call() async {
    try {
      final result = await gamesRepository.getGames();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: e.toString());
    }
  }
}

class GameDetailUseCase implements UseCase<dynamic, int> {
  final GamesRepository gamesRepository;

  const GameDetailUseCase(this.gamesRepository);

  @override
  Future<ApiResult<GameDetail>> call(int id) async {
    try {
      final result = await gamesRepository.getGame(id);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: e.toString());
    }
  }
}