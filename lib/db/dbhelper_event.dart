import 'package:sqflite/sqflite.dart';
import 'package:untitled/db/dbhelper.dart';
import 'package:untitled/model/task.dart';
import 'package:untitled/model/task_event.dart';

class DBHelperEvent{
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'task_event';

  static Future<void> initDb()async{
    // if(_db != null) {
    //   return;
    // }
    try{
      String _path = await getDatabasesPath() + 'tasks.db';
      // String _path = DBHelper.;

      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) async {
          print("creating a new db");
           return await db.execute(
            "CREATE TABLE $_tableName("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "event STRING, leader STRING, team STRING "
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(TaskEvent? task_event) async {
    print('insertion in progress');
    return await _db?.insert(_tableName, task_event!.toJson())??1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('retriving data');
    return await _db!.query(_tableName);
  }
}