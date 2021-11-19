import 'dart:io';

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

  Future<ServerResponse<dynamic, ServerErrorResponse>> DOWNLOAD_FILE(
      String url, String savePath) async {
    try {
      Response response = await _dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return (status ?? 1000) < 500;
            }),
      );
      simpleLogger.d(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
      return ServerResponse.success(savePath);
    } catch (e) {
      simpleLogger.e(e);
      return ServerResponse.error(ServerErrorResponse(-1, e.toString()));
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      simpleLogger.d((received / total * 100).toStringAsFixed(0) + "%");
    }
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
