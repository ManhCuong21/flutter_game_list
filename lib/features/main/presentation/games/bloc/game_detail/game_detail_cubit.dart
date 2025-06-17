import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_list/features/main/domain/entities/game_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api/api_result.dart';
import '../../../../domain/usecase/game_usecase.dart';

part 'game_detail_cubit.freezed.dart';

part 'game_detail_state.dart';

class GameDetailCubit extends Cubit<GameDetailState> {
  final GameDetailUseCase _gameUseCase;

  GameDetailCubit(this._gameUseCase) : super(GameDetailState(game: GameDetail.empty()));

  Future<void> loadGame(int id) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _gameUseCase(id);

    if (result is Success<GameDetail>) {
      emit(state.copyWith(game: result.data, isLoading: false));
    } else if (result is FailureApi<List<GameDetail>>) {
      final error = result.hashCode;
      emit(state.copyWith(error: error.toString(), isLoading: false));
    }
  }
}