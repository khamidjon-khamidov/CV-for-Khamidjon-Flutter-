import 'package:cv_for_khamidjon/base/base_api_provider.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/achievements/achievement_group.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';

class AchievementsApiProvider extends BaseApiProvider {
  AchievementsApiProvider(Dio dio) : super(dio);

  Future<ServerResponse<List<AchievementGroup>, ServerErrorResponse>> getAchievements() async {
    simpleLogger.d('Khamidjon: REQUEST: getAchievements');

    ServerResponse response = await GET(AppConstants.GET_ACHIEVEMENTS_PATH);
    if (response.isError) {
      return ServerResponse<List<AchievementGroup>, ServerErrorResponse>.error(response.error!);
    }
    try {
      List<AchievementGroup> projects = (response.success! as List<dynamic>)
          .map((map) => AchievementGroup.fromJson(map))
          .toList();
      return ServerResponse<List<AchievementGroup>, ServerErrorResponse>.success(projects);
    } catch (e) {
      logger.e(e);
      return ServerResponse<List<AchievementGroup>, ServerErrorResponse>.error(
        ServerErrorResponse(
          0,
          S.current.unexpected_error_occurred,
        ),
      );
    }
  }
}
