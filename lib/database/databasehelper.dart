import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class DatabaseHelper {
  final databaseName = "testDB.db";
  String userTable =
      "Create Tabel users (usrId integer primary key autoincrement, usrName Text, usrPassword Text)";
  String userData = "inser into users values(1, 'flutter', '123')";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      // defaut untuk user login
      await db.execute(userData);
      // user tabel
      await db.rawQuery(userTable);
    });
  }

  // method for login
  Future<bool> authentication(Users users) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from users usrName = '${users.usrName}' and users usrPassword = '${users.usrPassword}'");

    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
