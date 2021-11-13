import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/ServerErrorResponse.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';

abstract class BaseApiProvider {
  final Dio _dio;

  BaseApiProvider(this._dio);

  Future<ServerResponse<dynamic, ServerErrorResponse>> GET(final String endpoint,
      {final Map<String, dynamic>? queryParameters}) {
    return _sendAndParse<dynamic>(_dio.get<dynamic>(endpoint, queryParameters: queryParameters));
  }

  Future<ServerResponse<T, ServerErrorResponse>> _sendAndParse<T>(
      final Future<Response<dynamic>> request) async {
    Response response = await request;
    if (response.statusCode == 200) {
      simpleLogger.d('Received success response: ${response.data}');
      return ServerResponse<T, ServerErrorResponse>.success(response.data[0]);
    } else {
      simpleLogger
          .d('Request failed. Response: ${response.toString()}, Request: ${request.toString()}');
      return ServerResponse<T, ServerErrorResponse>.error(ServerErrorResponse(
          response.statusCode ?? -1, response.statusMessage ?? 'Error without response.'));
    }
  }

  ServerErrorResponse _tryToParseError(final dynamic error) {
    if (error is DioError) {
      simpleLogger
          .d("Got dio error. ${error.error}, ${error.response}, ${error.message}, ${error.type}");
      return ServerErrorResponse(error.response?.statusCode ?? 0, error.message);
    }

    return ServerErrorResponse(0, error.toString());
  }
}
