import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Finance.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE User(
          id INTEGER PRIMARY KEY,
          username TEXT NOT NULL,
          password TEXT NOT NULL
        )
      ''');
    }, version: _version);
  }

  Future<int> updateUserPassword(Users user) async {
    final db = await _getDB();
    return await db.update(
      "User",
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<Users?> getUserByUsername(String username) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(
      "User",
      where: 'username = ?',
      whereArgs: [username],
    );
    if (maps.isEmpty) {
      return null;
    }
    return Users.fromJson(maps.first);
  }

  static Future<int> addUser(Users user) async {
    final db = await _getDB();
    return await db.insert("User", user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<Users?> loginUser(String username, String password) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(
      "User",
      where: "username = ? AND password = ?",
      whereArgs: [username, password],
    );
    if (maps.isEmpty) {
      return null;
    }
    return Users.fromJson(maps[0]);
  }
}
