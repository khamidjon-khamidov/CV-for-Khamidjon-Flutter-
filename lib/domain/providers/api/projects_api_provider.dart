import 'package:cv_for_khamidjon/base/base_api_provider.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/projects/project.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';

class ProjectsApiProvider extends BaseApiProvider {
  ProjectsApiProvider(Dio dio) : super(dio);

  Future<ServerResponse<List<Project>, ServerErrorResponse>> getProjects() async {
    simpleLogger.d('Khamidjon: REQUEST: getProjects');

    ServerResponse response = await GET(AppConstants.GET_PROJECTS_PATH);
    if (response.isError) {
      return ServerResponse<List<Project>, ServerErrorResponse>.error(response.error!);
    }
    try {
      List<Project> projects =
          (response.success! as List<dynamic>).map((map) => Project.fromJson(map)).toList();
      return ServerResponse<List<Project>, ServerErrorResponse>.success(projects);
    } catch (e) {
      logger.e(e);
      return ServerResponse<List<Project>, ServerErrorResponse>.error(
        ServerErrorResponse(
          0,
          S.current.unexpected_error_occurred,
        ),
      );
    }
  }
}
