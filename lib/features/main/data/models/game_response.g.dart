// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameResponse _$GameResponseFromJson(Map<String, dynamic> json) => GameResponse(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  thumbnail: json['thumbnail'] as String?,
  shortDescription: json['short_description'] as String?,
  gameUrl: json['gameUrl'] as String?,
  genre: json['genre'] as String?,
  platform: json['platform'] as String?,
  publisher: json['publisher'] as String?,
  developer: json['developer'] as String?,
  releaseDate: json['release_date'] as String?,
  profileUrl: json['profile_url'] as String?,
);

Map<String, dynamic> _$GameResponseToJson(GameResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'short_description': instance.shortDescription,
      'gameUrl': instance.gameUrl,
      'genre': instance.genre,
      'platform': instance.platform,
      'publisher': instance.publisher,
      'developer': instance.developer,
      'release_date': instance.releaseDate,
      'profile_url': instance.profileUrl,
    };
