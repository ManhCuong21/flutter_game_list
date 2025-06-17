import '../../data/models/game_detail_response.dart';

class GameDetail {
  final int id;
  final String title;
  final String thumbnail;
  final String status;
  final String shortDescription;
  final String description;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String profileUrl;
  final MinimumSystemRequirements? minimumSystemRequirements;
  final List<Screenshot> screenshots;

  GameDetail({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.status,
    required this.shortDescription,
    required this.description,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.profileUrl,
    required this.minimumSystemRequirements,
    required this.screenshots,
  });

  factory GameDetail.empty() => GameDetail(
    id: 0,
    title: '',
    thumbnail: '',
    status: '',
    shortDescription: '',
    description: '',
    gameUrl: '',
    genre: '',
    platform: '',
    publisher: '',
    developer: '',
    releaseDate: '',
    profileUrl: '',
    minimumSystemRequirements: null,
    screenshots: [],
  );
}
