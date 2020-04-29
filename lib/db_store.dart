import 'dart:math';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'label_models.dart';

class DBStore {
  DBStore._();

  static Database _sqDatabase;
  static final db = DBStore._();

  Future<Database> get database async {
    // If database exists, return database
    if (_sqDatabase != null) {
      return _sqDatabase;
    }

    // If database don't exists, create one
    _sqDatabase = await initNewDB();

    return _sqDatabase;
  }

  Future initNewDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'myapp_sqlite.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // Table for App Labels
      await db.execute(
        'CREATE TABLE AppLabels(id INTEGER PRIMARY KEY,name TEXT,description TEXT)',
      );
      await db.execute(
        'CREATE TABLE ApiCacheLog(id INTEGER PRIMARY KEY,name TEXT,lastUpdated TEXT)',
      );
    });
  }

  Future updateCacheLog(CacheLog cacheLog) async {
    final db = await database;
    final queryResult = await db.insert('ApiCacheLog', cacheLog.toMap());

    return queryResult;
  }

  Future inserAppLabels(List appLabelsList) async {
    final db = await database;
    final batch = db.batch();

    await clearTable('AppLabels');

    for (int i = 0; i < appLabelsList.length; i++) {
      batch.insert('AppLabels', appLabelsList[i].toMap());
    }

    await batch.commit();
    await updateCacheLog(CacheLog(
      Random().nextInt(100),
      'AppLabels',
      (DateTime.now().toUtc()).toString(),
    ));
  }

// Get All app labels
  Future getAppLabels() async {
    final db = await database;
    final labels = await db.query('AppLabels');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return labels.isNotEmpty
        ? List.generate(
            labels.length,
            (i) => AppLabelContent(
              labels[i]['id'],
              labels[i]['name'],
              labels[i]['description'],
            ),
          )
        : [];
  }

  // Delete all rows
  Future clearTable(String tableName) async {
    final db = await database;
    final queryResult = await db.rawDelete('DELETE FROM $tableName');

    return queryResult;
  }
}
