// ignore_for_file: implementation_imports
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/adapters/io_adapter.dart';

import '../../../flavors.dart';

const _defaultConnectTimeout = 5 * Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = 5 * Duration.millisecondsPerMinute;

class AppNetworkClient with DioMixin implements Dio {

  AppNetworkClient() {
    options =
        BaseOptions(
            baseUrl: F.apiUrl,
            headers: {
              "x-rapidapi-host": "mmo-games.p.rapidapi.com",
              "x-rapidapi-key":
              "c86df56ce7mshda3af6cab0c4d82p199eb6jsnef9b8df636cb",
            },
            receiveTimeout: const Duration(milliseconds: 60 * 1000 * 2),
            connectTimeout: const Duration(milliseconds: 60 * 1000 * 2),
            contentType: 'application/json',
          )
          ..connectTimeout = const Duration(
            milliseconds: _defaultConnectTimeout,
          )
          ..receiveTimeout = const Duration(
            milliseconds: _defaultReceiveTimeout,
          );
    httpClientAdapter = IOHttpClientAdapter();
    interceptors.add(
      InterceptorsWrapper(
        // onRequest: _requestInterceptor,
        onResponse: _responseInterceptor,
        onError: _errorInterceptor,
      ),
    );
    interceptors.addAll([CurlLoggerDioInterceptor(printOnSuccess: true)]);
  }

  // Future<void> _requestInterceptor(
  //   RequestOptions options,
  //   RequestInterceptorHandler handler,
  // ) async {
  //   options.headers["x-rapidapi-host"] = "mmo-games.p.rapidapi.com";
  //   options.headers["x-rapidapi-key"] = 'c86df56ce7mshda3af6cab0c4d82p199eb6jsnef9b8df636cb';
  //   return handler.next(options);
  // }

  Future<void> _responseInterceptor(
    response,
    ResponseInterceptorHandler handler,
  ) async {
    return handler.next(response);
  }

  Future<void> _errorInterceptor(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    return handler.next(error); //continue
  }
}