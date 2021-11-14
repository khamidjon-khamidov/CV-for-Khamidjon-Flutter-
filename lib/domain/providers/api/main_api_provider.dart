import 'package:cv_for_khamidjon/base/base_api_provider.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/ServerErrorResponse.dart';
import 'package:cv_for_khamidjon/domain/models/main_pages/about_me.dart';
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
      AboutMe aboutMe = AboutMe.fromJson(response.success!);
      return ServerResponse<AboutMe, ServerErrorResponse>.success(aboutMe);
    } catch (e) {
      simpleLogger.d('Failed parsing response: ${response.success}');
      return ServerResponse<AboutMe, ServerErrorResponse>.error(response.error!);
    }
  }
}
