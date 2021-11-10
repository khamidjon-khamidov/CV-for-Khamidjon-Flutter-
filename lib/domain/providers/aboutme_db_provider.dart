import 'package:cv_for_khamidjon/domain/models/main/about_me.dart';
import 'package:sembast/sembast.dart';

class AboutMeDbProvider {
  static const String _ABOUT_ME_STORE_NAME = 'ABOUT_ME_TABLE';

  final Database _db;
  final _store = StoreRef<String, Map<String, dynamic>>(_ABOUT_ME_STORE_NAME);

  AboutMeDbProvider(this._db);

  Stream<List<AboutMe>> observeGallery() => _store
      .query()
      .onSnapshots(_db)
      .map((e) => e.map((el) => TaskVideoModel.fromMap(el.value)).toList());
}
