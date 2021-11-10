import 'package:cv_for_khamidjon/base/base_api_provider.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/ServerErrorResponse.dart';
import 'package:cv_for_khamidjon/domain/models/main/about_me.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/src/dio.dart';
import 'package:rxdart/src/transformers/switch_map.dart';

class MainApiProvider extends BaseApiProvider {
  MainApiProvider(Dio dio) : super(dio);

  Stream<ServerResponse<AboutMe, ServerErrorResponse>> getAboutMe() {
    simpleLogger.d('Khamidjon: REQUEST: getAboutMe');

    return GET(AppConstants.GET_ABOUT_ME_PATH)
        .switchMap<ServerResponse<AboutMe, ServerErrorResponse>>((res) {
      if (res.isError) {
        return Stream.value(ServerResponse<AboutMe, ServerErrorResponse>.error(res.error!));
      }
      try {
        AboutMe aboutMe = AboutMe.fromJson(res.success!);
        return Stream.value(ServerResponse<AboutMe, ServerErrorResponse>.success(aboutMe));
      } catch (e) {
        simpleLogger.d('Failed parsing response: ${res.success}');
        return Stream.value(ServerResponse<AboutMe, ServerErrorResponse>.error(res.error!));
      }
    });
  }
}
