import 'package:dio/dio.dart';
import 'package:flutter_game_list/features/main/data/models/game_response.dart';
import 'package:flutter_game_list/features/main/data/models/game_detail_response.dart';
import 'package:retrofit/http.dart';
import '../../../../core/network/endpoint/endpoint.dart';

part 'game_services.g.dart';

@RestApi()
abstract class GameService {
  factory GameService(Dio dio, {String baseUrl}) = _GameService;

  @GET(Endpoint.games)
  Future<List<GameResponse>> getGames();

  @GET(Endpoint.game)
  Future<GameDetailResponse> getGame(@Query("id") int id);
}

class ParseErrorLogger {
  void logError(dynamic error, StackTrace? code, RequestOptions? extra) {}
}
