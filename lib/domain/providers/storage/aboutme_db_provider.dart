import 'package:cv_for_khamidjon/domain/models/main_pages/about_me.dart';
import 'package:sembast/sembast.dart';

class AboutMeDbProvider {
  static const String _ABOUT_ME_STORE_NAME = 'ABOUT_ME_TABLE';

  final Database _db;
  final _store = StoreRef<String, Map<String, dynamic>>(_ABOUT_ME_STORE_NAME);

  AboutMeDbProvider(this._db);

  Future putByReplacing(AboutMe aboutMe) async {
    await _db.transaction(
      (txn) async {
        await _store.delete(txn);
        await _store.record(aboutMe.id).put(txn, aboutMe.toJson());
      },
    );
  }

  Future<AboutMe?> read() async {
    final snapshot = await _store.find(_db);
    var list = snapshot.map((e) => AboutMe.fromJson(e.value)).toList();

    if (list.isNotEmpty) {
      return list.first;
    }

    return null;
  }

  Future delete() async => _store.delete(_db);

  Future clear() async => _store.drop(_db);
}
