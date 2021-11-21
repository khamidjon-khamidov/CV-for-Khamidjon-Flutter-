import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/posts/post.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/domain/providers/api/post_api_provider.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/posts_db_provider.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';

class PostsRepository {
  final PostsDbProvider _postsDbProvider;
  final PostsApiProvider _postsApiProvider;

  PostsRepository({
    required Dio dio,
    required Database database,
  })  : _postsApiProvider = PostsApiProvider(dio),
        _postsDbProvider = PostsDbProvider(database);

  Future<BlocResponse> getSkills() async {
    try {
      ServerResponse<List<Post>, ServerErrorResponse> response = await _postsApiProvider.getPosts();
      if (response.isSuccess) {
        await _postsDbProvider.replaceAll(response.success!);
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
    List<Post> skills = await _postsDbProvider.readAll();
    if (skills.isEmpty) {
      return ErrorBlockResponse(S.current.fetching_data_failed);
    }
    return FromStorageBlockResponse(
      skills,
      extraMessage: S.current.data_got_from_storage_due_to_network_error,
    );
  }
}
