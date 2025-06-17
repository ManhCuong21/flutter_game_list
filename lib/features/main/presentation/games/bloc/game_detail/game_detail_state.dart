part of 'game_detail_cubit.dart';

@freezed
abstract class GameDetailState with _$GameDetailState {
  const factory GameDetailState({
    required GameDetail game,
    @Default(false) bool isLoading,
    String? error,
  }) = _GameDetailState;
}