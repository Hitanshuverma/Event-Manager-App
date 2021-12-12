import 'package:sqflite/sqflite.dart';
import 'package:untitled/model/task.dart';
import 'package:untitled/model/task_event.dart';

class DBHelper{
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'task';

 static Future<void> initDb()async{
    if(_db != null) {
      return;
    }
    try{
      String _path = await getDatabasesPath() + 'tasks.db';
      _db = await openDatabase(
          _path,
      version: _version,
      onCreate: (db, version) {
            print("creating a new db");
            db.execute(
              "CREATE TABLE $_tableName("
                  "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "title STRING, des STRING, date STRING, "
                  "remind INTEGER,  color INTEGER, "
                  "isCompleted INTEGER)",

            );
            // db.execute(
            //     "CREATE TABLE $_tableName("
            //         "event STRING, leader STRING, team STRING "
            // );
      },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print('insertion in progress');
    return await _db?.insert(_tableName, task!.toJson())??1;
  }

  // static Future<int> insertEvent(TaskEvent? task_event) async {
  //   print('insertion in progress');
  //   return await _db?.insert(_tableName, task_event!.toJson())??1;
  // }

  static Future<List<Map<String, dynamic>>> query() async {
    print('insertion in progress');
    return await _db!.query(_tableName);
  }

}