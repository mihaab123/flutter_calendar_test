import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var database = await openDatabase(
        join(await getDatabasesPath(), "db_tasks_sqflite.db"),
        version: 1,
        onCreate: _createDB);
    return database;
  }

  void _createDB(Database database, int version) async {
    await database.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, date INTEGER,  description TEXT)");
  }
}
