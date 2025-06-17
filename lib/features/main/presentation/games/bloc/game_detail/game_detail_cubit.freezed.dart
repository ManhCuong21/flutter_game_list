// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameDetailState {

 GameDetail get game; bool get isLoading; String? get error;
/// Create a copy of GameDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameDetailStateCopyWith<GameDetailState> get copyWith => _$GameDetailStateCopyWithImpl<GameDetailState>(this as GameDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDetailState&&(identical(other.game, game) || other.game == game)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,game,isLoading,error);

@override
String toString() {
  return 'GameDetailState(game: $game, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $GameDetailStateCopyWith<$Res>  {
  factory $GameDetailStateCopyWith(GameDetailState value, $Res Function(GameDetailState) _then) = _$GameDetailStateCopyWithImpl;
@useResult
$Res call({
 GameDetail game, bool isLoading, String? error
});




}
/// @nodoc
class _$GameDetailStateCopyWithImpl<$Res>
    implements $GameDetailStateCopyWith<$Res> {
  _$GameDetailStateCopyWithImpl(this._self, this._then);

  final GameDetailState _self;
  final $Res Function(GameDetailState) _then;

/// Create a copy of GameDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? game = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
game: null == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as GameDetail,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _GameDetailState implements GameDetailState {
  const _GameDetailState({required this.game, this.isLoading = false, this.error});
  

@override final  GameDetail game;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of GameDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameDetailStateCopyWith<_GameDetailState> get copyWith => __$GameDetailStateCopyWithImpl<_GameDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameDetailState&&(identical(other.game, game) || other.game == game)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,game,isLoading,error);

@override
String toString() {
  return 'GameDetailState(game: $game, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$GameDetailStateCopyWith<$Res> implements $GameDetailStateCopyWith<$Res> {
  factory _$GameDetailStateCopyWith(_GameDetailState value, $Res Function(_GameDetailState) _then) = __$GameDetailStateCopyWithImpl;
@override @useResult
$Res call({
 GameDetail game, bool isLoading, String? error
});




}
/// @nodoc
class __$GameDetailStateCopyWithImpl<$Res>
    implements _$GameDetailStateCopyWith<$Res> {
  __$GameDetailStateCopyWithImpl(this._self, this._then);

  final _GameDetailState _self;
  final $Res Function(_GameDetailState) _then;

/// Create a copy of GameDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? game = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_GameDetailState(
game: null == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as GameDetail,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
