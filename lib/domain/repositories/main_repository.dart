import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/main_pages/about_me.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/domain/providers/api/main_api_provider.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/aboutme_db_provider.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';

class MainRepository {
  final AboutMeDbProvider _aboutMeDbProvider;
  final MainApiProvider _mainApiProvider;
  String cvFileName = 'CV_Khamidjon_Khamidov';

  MainRepository({
    required Dio dio,
    required Database database,
  })  : _aboutMeDbProvider = AboutMeDbProvider(database),
        _mainApiProvider = MainApiProvider(dio);

  Future<BlocResponse> getAboutMe() async {
    try {
      ServerResponse<AboutMe, ServerErrorResponse> response = await _mainApiProvider.getAboutMe();
      if (response.isSuccess) {
        await _aboutMeDbProvider.putByReplacing(response.success!);
        return FromNetworkBlocResponse(response.success!,
            extraMessage: S.current.data_received_successfully);
      } else {
        return fetchAboutMeFromDb();
      }
    } catch (e) {
      logger.e(e);
      return fetchAboutMeFromDb();
    }
  }

  Future<String?> downloadCV(String cvLink) async {
    String prefix = 'doc';
    if (cvLink.contains('docx')) {
      prefix = 'docx';
    } else if (cvLink.contains('pdf')) {
      prefix = 'pdf';
    }

    String fullPath = join((await getTemporaryDirectory()).path, '$cvFileName.$prefix');
    var response = await _mainApiProvider.downloadCv(cvLink, fullPath);
    if (response.isSuccess) {
      return response.success;
    } else {
      return null;
    }
  }

  Future<BlocResponse> fetchAboutMeFromDb() async {
    AboutMe? aboutMe = await _aboutMeDbProvider.read();
    if (aboutMe != null) {
      return FromStorageBlockResponse(aboutMe,
          extraMessage: S.current.data_got_from_storage_due_to_network_error);
    } else {
      return ErrorBlockResponse(S.current.fetching_data_failed);
    }
  }
}
