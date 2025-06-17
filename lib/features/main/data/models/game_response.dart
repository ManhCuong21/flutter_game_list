import 'package:flutter_game_list/core/mapper/entity_convertible.dart';
import 'package:flutter_game_list/features/main/domain/entities/games.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_response.g.dart';

@JsonSerializable()
class GameResponse with EntityConvertible<GameResponse,Games>{
  int? id;
  String? title;
  String? thumbnail;
  @JsonKey(name: 'short_description')
  String? shortDescription;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'profile_url')
  String? profileUrl;

  GameResponse({
    this.id,
    this.title,
    this.thumbnail,
    this.shortDescription,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
    this.profileUrl,
  });

  factory GameResponse.fromJson(Map<String, dynamic> json) => _$GameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GameResponseToJson(this);

  @override
  Games toEntity() {
    return Games(
      id: id,
      title: title,
      thumbnail: thumbnail,
      shortDescription: shortDescription,
      gameUrl: gameUrl,
      genre: genre,
      platform: platform,
      publisher: publisher,
      developer: developer,
      releaseDate: releaseDate,
      profileUrl: profileUrl,
    );
  }
}