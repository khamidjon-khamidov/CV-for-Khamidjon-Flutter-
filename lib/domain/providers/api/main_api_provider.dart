import 'package:cv_for_khamidjon/base/base_api_provider.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/main_pages/about_me.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/src/dio.dart';

class MainApiProvider extends BaseApiProvider {
  MainApiProvider(Dio dio) : super(dio);

  Future<ServerResponse<AboutMe, ServerErrorResponse>> getAboutMe() async {
    simpleLogger.d('Khamidjon: REQUEST: getAboutMe');

    ServerResponse response = await GET(AppConstants.GET_ABOUT_ME_PATH);
    if (response.isError) {
      return ServerResponse<AboutMe, ServerErrorResponse>.error(response.error!);
    }
    try {
      List<AboutMe> aboutMes =
          (response.success! as List<dynamic>).map((map) => AboutMe.fromJson(map)).toList();
      return ServerResponse<AboutMe, ServerErrorResponse>.success(aboutMes[0]);
    } catch (e) {
      logger.e(e);
      return ServerResponse<AboutMe, ServerErrorResponse>.error(
        ServerErrorResponse(
          0,
          S.current.unexpected_error_occurred,
        ),
      );
    }
  }

  Future<ServerResponse<String, ServerErrorResponse>> downloadCv(
      String url, String savePath) async {
    simpleLogger.d('Khamidjon: REQUEST: downloadCV');

    ServerResponse response = await DOWNLOAD_FILE(url, savePath);

    if (response.isError) {
      return ServerResponse<String, ServerErrorResponse>.error(response.error);
    }

    return ServerResponse<String, ServerErrorResponse>.success(response.success);
  }
}
