import 'package:cv_for_khamidjon/domain/models/skills/skill.dart';
import 'package:sembast/sembast.dart';

class SkillsDbProvider {
  static const String _SKILLS_STORE_NAME = 'SKILLS_ME_TABLE';

  final Database _db;
  final _store = StoreRef<String, Map<String, dynamic>>(_SKILLS_STORE_NAME);

  SkillsDbProvider(this._db);

  Stream<List<Skill>> observeSkills() => _store
      .query()
      .onSnapshots(_db)
      .map((list) => list.map((skillJson) => Skill.fromJson(skillJson.value)).toList());

  Future putByReplacing(Skill skill) async {
    await _db.transaction(
      (txn) async {
        await _store.delete(txn);
        await _store.record(skill.id).put(txn, skill.toJson());
      },
    );
  }

  Future<Skill?> read() async {
    final snapshot = await _store.find(_db);
    var list = snapshot.map((e) => Skill.fromJson(e.value)).toList();

    if (list.isNotEmpty) {
      return list.first;
    }

    return null;
  }

  Future delete() async => _store.delete(_db);

  Future clear() async => _store.drop(_db);
}
