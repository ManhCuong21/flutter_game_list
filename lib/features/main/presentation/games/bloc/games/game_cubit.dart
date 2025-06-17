import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_list/features/main/domain/entities/games.dart';
import 'package:flutter_game_list/features/main/domain/usecase/game_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api/api_result.dart';

part 'game_cubit.freezed.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final GameUseCase _gameUseCase;

  GameCubit(this._gameUseCase) : super(const GameState());

  Future<void> loadGames() async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _gameUseCase();

    if (result is Success<List<Games>>) {
      final games = result.data;
      emit(state.copyWith(games: games, isLoading: false));
    } else if (result is FailureApi<List<Games>>) {
      final error = result.error;
      emit(state.copyWith(error: error, isLoading: false));
    }
  }
}
