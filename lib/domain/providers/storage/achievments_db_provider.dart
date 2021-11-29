import 'package:cv_for_khamidjon/domain/models/achievements/achievement_group.dart';
import 'package:sembast/sembast.dart';

class AchievementDbProvider {
  static const String _ACHIEVEMENTS_STORE_NAME = 'ACHIEVEMENT_ME_TABLE';

  final Database _db;
  final _store = StoreRef<String, Map<String, dynamic>>(_ACHIEVEMENTS_STORE_NAME);

  AchievementDbProvider(this._db);

  Stream<List<AchievementGroup>> observeAchievements() => _store.query().onSnapshots(_db).map(
      (list) => list.map((achievements) => AchievementGroup.fromJson(achievements.value)).toList());

  Future replaceAll(List<AchievementGroup> achievements) => _db.transaction(
        (txn) async {
          await _store.delete(txn);
          await _store.records(achievements.map((e) => e.id.toString())).put(
                txn,
                achievements.map((e) => e.toJson()).toList(),
              );
        },
      );

  Future<List<AchievementGroup>> readAll() async {
    final snapshot = await _store.find(_db);
    return snapshot.map((e) => AchievementGroup.fromJson(e.value)).toList();
  }

  Future deleteAll() async => _store.delete(_db);

  Future clear() async => _store.drop(_db);
}
