import 'package:get/get.dart';
import 'package:untitled/db/dbhelper.dart';
import 'package:untitled/model/task.dart';


class TaskController extends GetxController {

  @override
  void onReady(){
    super.onReady();
  }

    var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async{
    return await DBHelper.insert(task);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  // print(taskList.length);
}