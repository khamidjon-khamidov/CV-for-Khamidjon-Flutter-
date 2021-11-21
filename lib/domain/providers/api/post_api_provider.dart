import 'package:cv_for_khamidjon/base/base_api_provider.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/posts/post.dart';
import 'package:cv_for_khamidjon/domain/models/server_error_response.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/utils/constants.dart';
import 'package:cv_for_khamidjon/utils/server_response.dart';
import 'package:dio/dio.dart';

class PostApiProvider extends BaseApiProvider {
  PostApiProvider(Dio dio) : super(dio);

  Future<ServerResponse<List<Post>, ServerErrorResponse>> getPosts() async {
    simpleLogger.d('Khamidjon: REQUEST: getProjects');

    ServerResponse response = await GET(AppConstants.GET_POSTS_PATH);
    if (response.isError) {
      return ServerResponse<List<Post>, ServerErrorResponse>.error(response.error!);
    }
    try {
      List<Post> posts =
          (response.success! as List<dynamic>).map((map) => Post.fromJson(map)).toList();
      return ServerResponse<List<Post>, ServerErrorResponse>.success(posts);
    } catch (e) {
      logger.e(e);
      return ServerResponse<List<Post>, ServerErrorResponse>.error(
        ServerErrorResponse(
          0,
          S.current.unexpected_error_occurred,
        ),
      );
    }
  }
}
