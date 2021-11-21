import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/projects/project.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/domain/providers/api/projects_api_provider.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/projects_db_provider.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';

class ProjectsRepository {
  final ProjectsDbProvider _projectsDbProvider;
  final ProjectsApiProvider _projectsApiProvider;

  ProjectsRepository({
    required Dio dio,
    required Database database,
  })  : _projectsApiProvider = ProjectsApiProvider(dio),
        _projectsDbProvider = ProjectsDbProvider(database);

  Future<BlocResponse> getProjects() async {
    try {
      ServerResponse<List<Project>, ServerErrorResponse> response =
          await _projectsApiProvider.getProjects();
      if (response.isSuccess) {
        await _projectsDbProvider.replaceAll(response.success!);
        return FromNetworkBlocResponse(
          response.success!,
          extraMessage: S.current.data_received_successfully,
        );
      }
    } catch (e) {
      logger.e(e);
    }

    return fetchProjectsFromDb();
  }

  Future<BlocResponse> fetchProjectsFromDb() async {
    List<Project> skills = await _projectsDbProvider.readAll();
    if (skills.isEmpty) {
      return ErrorBlockResponse(S.current.fetching_data_failed);
    }
    return FromStorageBlockResponse(
      skills,
      extraMessage: S.current.data_got_from_storage_due_to_network_error,
    );
  }
}
