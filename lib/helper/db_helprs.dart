import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class Dbhelprs {
  static Future<Database> database() async {
    var dbpath = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(dbpath, 'places.db'),
        onCreate: (db, version) async {
     return  db.execute(
          'CREATE TABLE user_placse (id INTEGER PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);
  }

  static Future<void> inser(String table, Map<String, Object> date) async {
    final db = await Dbhelprs.database();
    db.insert(table, date, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String,dynamic>>> getDate(String table) async {
    final db = await Dbhelprs.database();
   return db.query(table);
  }
}
