import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/achievements/achievement_group.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/domain/providers/api/achievements_api_provider.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/achievments_db_provider.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';

class AchievementsRepository {
  final AchievementDbProvider _achievementDbProvider;
  final AchievementsApiProvider _achievementsApiProvider;

  AchievementsRepository({
    required Dio dio,
    required Database database,
  })  : _achievementDbProvider = AchievementDbProvider(database),
        _achievementsApiProvider = AchievementsApiProvider(dio);

  Future<BlocResponse> getAchievements() async {
    try {
      ServerResponse<List<AchievementGroup>, ServerErrorResponse> response =
          await _achievementsApiProvider.getAchievements();
      if (response.isSuccess) {
        await _achievementDbProvider.replaceAll(response.success!);
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
    List<AchievementGroup> skills = await _achievementDbProvider.readAll();
    if (skills.isEmpty) {
      return ErrorBlockResponse(S.current.fetching_data_failed);
    }
    return FromStorageBlockResponse(
      skills,
      extraMessage: S.current.data_got_from_storage_due_to_network_error,
    );
  }
}
