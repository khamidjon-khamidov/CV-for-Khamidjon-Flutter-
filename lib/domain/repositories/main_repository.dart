import 'package:cv_for_khamidjon/domain/models/ServerErrorResponse.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/main/about_me.dart';
import 'package:cv_for_khamidjon/domain/providers/api/main_api_provider.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/aboutme_db_provider.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';

class MainRepository {
  final AboutMeDbProvider aboutMeDbProvider;
  final MainApiProvider mainApiProvider;

  MainRepository({
    required Dio dio,
    required Database database,
  })  : aboutMeDbProvider = AboutMeDbProvider(database),
        mainApiProvider = MainApiProvider(dio);

  Future<BlocResponse> getAboutMe() async {
    try {
      ServerResponse<AboutMe, ServerErrorResponse> response = await mainApiProvider.getAboutMe();
      if (response.isSuccess) {
        await aboutMeDbProvider.putByReplacing(response.success!);
        return FromNetworkBlocResponse(response.success!,
            extraMessage: S.current.data_received_successfully);
      } else {
        return fetchAboutMeFromDb();
      }
    } catch (e) {
      return fetchAboutMeFromDb();
    }
  }

  Future<BlocResponse> fetchAboutMeFromDb() async {
    AboutMe? aboutMe = await aboutMeDbProvider.read();
    if (aboutMe != null) {
      return FromStorageBlockResponse(aboutMe,
          extraMessage: S.current.data_got_from_storage_due_to_network_error);
    } else {
      return ErrorBlockResponse(S.current.fetching_data_failed);
    }
  }
}
