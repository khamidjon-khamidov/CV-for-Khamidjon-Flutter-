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
  final SkillsDbProvider skillsDbProvider;
  final SkillsApiProvider skillsApiProvider;

  SkillsRepository({
    required Dio dio,
    required Database database,
  })  : skillsApiProvider = SkillsApiProvider(dio),
        skillsDbProvider = SkillsDbProvider(database);

  Future<BlocResponse> getSkills() async {
    try {
      ServerResponse<List<Skill>, ServerErrorResponse> response = await skillsApiProvider.getSkills();
      if(response.isSuccess){
        await skillsDbProvider.replaceAll(response.success!);
        return FromNetworkBlocResponse(response.success!, extraMessage: S.current.data_received_successfully,);
      }
    } catch (e) {}

    return fetchSkillsFromDb();
  }

  Future<BlocResponse> fetchSkillsFromDb() async {
    List<Skill> skills = await skillsDbProvider.readAll();
    if (skills.isEmpty) {
      return ErrorBlockResponse(S.current.fetching_data_failed);
    }
    return FromStorageBlockResponse(
      skills,
      extraMessage: S.current.data_got_from_storage_due_to_network_error,
    );
  }
}
