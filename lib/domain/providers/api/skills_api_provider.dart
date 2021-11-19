import 'package:cv_for_khamidjon/base/base_api_provider.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/domain/models/skills/skill.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';

class SkillsApiProvider extends BaseApiProvider {
  SkillsApiProvider(Dio dio) : super(dio);

  Future<ServerResponse<List<Skill>, ServerErrorResponse>> getSkills() async {
    simpleLogger.d('Khamidjon: REQUEST: getSkills');

    ServerResponse response = await GET(AppConstants.GET_SKILLS_PATH);
    if (response.isError) {
      return ServerResponse<List<Skill>, ServerErrorResponse>.error(response.error!);
    }
    try {
      List<Skill> skills = response.success!.map((map) => Skill.fromJson(map)).toList();
      return ServerResponse<List<Skill>, ServerErrorResponse>.success(skills);
    } catch (e) {
      simpleLogger.d('Failed parsing response: ${response.success}');
      return ServerResponse<List<Skill>, ServerErrorResponse>.error(response.error!);
    }
  }
}
