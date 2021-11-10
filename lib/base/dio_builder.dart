import 'package:dio/dio.dart';

import '../config.dart';

class DioBuilder {
  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = DioBuilder._create()._internalDio;
    }
    return _dio!;
  }

  Dio _internalDio;

  factory DioBuilder._create() {
    final DioBuilder dioBuilder = DioBuilder._(Config.BASE_URL);
    if (Config.showLogs) {
      dioBuilder._addLoggingInterceptor();
    }
    return dioBuilder;
  }

  DioBuilder._(final String host)
      : _internalDio = Dio(BaseOptions(
          baseUrl: host,
          connectTimeout: Duration(seconds: 30).inMilliseconds,
          receiveTimeout: Duration(seconds: 30).inMilliseconds,
        ));

  DioBuilder _addLoggingInterceptor() {
    _internalDio.interceptors.add(LogInterceptor(
      responseBody: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
    ));
    return this;
  }
}
