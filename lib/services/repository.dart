import 'package:flutter_calendar_test/services/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  static Database? _database;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  Future<Database> get database async {
    _database ??= await _databaseConnection.setDatabase();
    return _database!;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }

  updateData(table, data) async {
    var connection = await database;
    return await connection
        .update(table, data, where: "id = ?", whereArgs: [data["id"]]);
  }

  deleteData(table, itemID) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table where id = $itemID");
  }
}
