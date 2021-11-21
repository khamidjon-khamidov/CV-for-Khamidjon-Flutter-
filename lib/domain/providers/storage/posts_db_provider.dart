import 'package:cv_for_khamidjon/domain/models/posts/post.dart';
import 'package:sembast/sembast.dart';

class PostsDbProvider {
  static const String _POSTS_STORE_NAME = 'POSTS_ME_TABLE';

  final Database _db;
  final _store = StoreRef<String, Map<String, dynamic>>(_POSTS_STORE_NAME);

  PostsDbProvider(this._db);

  Stream<List<Post>> observeSkills() => _store
      .query()
      .onSnapshots(_db)
      .map((list) => list.map((postJson) => Post.fromJson(postJson.value)).toList());

  Future replaceAll(List<Post> posts) => _db.transaction(
        (txn) async {
          await _store.delete(txn);
          await _store.records(posts.map((e) => e.id.toString())).put(
                txn,
                posts.map((e) => e.toJson()).toList(),
              );
        },
      );

  Future<List<Post>> readAll() async {
    final snapshot = await _store.find(_db);
    return snapshot.map((e) => Post.fromJson(e.value)).toList();
  }

  Future deleteAll() async => _store.delete(_db);

  Future clear() async => _store.drop(_db);
}
