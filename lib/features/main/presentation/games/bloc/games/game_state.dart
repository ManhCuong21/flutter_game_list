part of 'game_cubit.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    @Default([]) List<Games> games,
    @Default(false) bool isLoading,
    String? error,
  }) = _GameState;
}