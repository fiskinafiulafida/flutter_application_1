import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../model/keuangan.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Keuangan.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute('''
  CREATE TABLE Keuangan(
    id INTEGER PRIMARY KEY,
    tanggal TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nominal INTEGER NOT NULL,
    ket TEXT NOT NULL,
    kategori TEXT NOT NULL
  )
'''), version: _version);
  }

  static Future<int> addKeuangan(Keuangan keuangan) async {
    final db = await _getDB();
    return await db.insert("Keuangan", keuangan.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Keuangan>?> getAllKeuangan() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Keuangan");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
        maps.length, (index) => Keuangan.fromJson(maps[index]));
  }
}
