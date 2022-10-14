import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "db_tasks_sqflite.db");
    var database = await openDatabase(path, version: 1, onCreate: _createDB);
    return database;
  }

  void _createDB(Database database, int version) async {
    await database.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, date INTEGER,  description TEXT");
  }
}
