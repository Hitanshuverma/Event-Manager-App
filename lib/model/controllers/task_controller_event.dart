import 'package:get/get.dart';
import 'package:untitled/db/dbhelper.dart';
import 'package:untitled/db/dbhelper_event.dart';
import 'package:untitled/model/task_event.dart';


class TaskControllerEvent extends GetxController {

  @override
  void onReady(){
    super.onReady();
  }

  var taskList = <TaskEvent>[].obs;

  Future<int> addTask({TaskEvent? task_event}) async{
    return await DBHelperEvent.insert(task_event);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelperEvent.query();
    taskList.assignAll(tasks.map((data) => new TaskEvent.fromJson(data)).toList());
  }

// print(taskList.length);
}