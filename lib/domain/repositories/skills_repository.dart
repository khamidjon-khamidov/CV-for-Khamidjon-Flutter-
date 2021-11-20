import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/domain/models/skills/skill.dart';
import 'package:cv_for_khamidjon/domain/providers/api/skills_api_provider.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/skills_db_provider.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';

class SkillsRepository {
  final SkillsDbProvider _skillsDbProvider;
  final SkillsApiProvider _skillsApiProvider;

  SkillsRepository({
    required Dio dio,
    required Database database,
  })  : _skillsApiProvider = SkillsApiProvider(dio),
        _skillsDbProvider = SkillsDbProvider(database);

  Future<BlocResponse> getSkills() async {
    try {
      ServerResponse<List<Skill>, ServerErrorResponse> response =
          await _skillsApiProvider.getSkills();
      if (response.isSuccess) {
        await _skillsDbProvider.replaceAll(response.success!);
        return FromNetworkBlocResponse(
          response.success!,
          extraMessage: S.current.data_received_successfully,
        );
      }
    } catch (e) {
      logger.e(e);
    }

    return fetchSkillsFromDb();
  }

  Future<BlocResponse> fetchSkillsFromDb() async {
    List<Skill> skills = await _skillsDbProvider.readAll();
    if (skills.isEmpty) {
      return ErrorBlockResponse(S.current.fetching_data_failed);
    }
    return FromStorageBlockResponse(
      skills,
      extraMessage: S.current.data_got_from_storage_due_to_network_error,
    );
  }
}
