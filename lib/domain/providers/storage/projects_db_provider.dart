import 'package:cv_for_khamidjon/domain/models/projects/project.dart';
import 'package:sembast/sembast.dart';

class ProjectsDbProvider {
  static const String _PROJECTS_STORE_NAME = 'PROJECTS_ME_TABLE';

  final Database _db;
  final _store = StoreRef<String, Map<String, dynamic>>(_PROJECTS_STORE_NAME);

  ProjectsDbProvider(this._db);

  Stream<List<Project>> observeSkills() => _store
      .query()
      .onSnapshots(_db)
      .map((list) => list.map((skillJson) => Project.fromJson(skillJson.value)).toList());

  Future replaceAll(List<Project> projects) => _db.transaction(
        (txn) async {
          await _store.delete(txn);
          await _store.records(projects.map((e) => e.id.toString())).put(
                txn,
                projects.map((e) => e.toJson()).toList(),
              );
        },
      );

  Future<List<Project>> readAll() async {
    final snapshot = await _store.find(_db);
    return snapshot.map((e) => Project.fromJson(e.value)).toList();
  }

  Future deleteAll() async => _store.delete(_db);

  Future clear() async => _store.drop(_db);
}
