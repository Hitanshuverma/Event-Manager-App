import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:untitled/add_ivent.dart';
import 'package:untitled/model/task.dart';
import 'package:untitled/task_tile.dart';

import 'model/controllers/task_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   // leading: const Icon(
      //   //   Icons.menu,
      //   //   color: Colors.blueGrey,
      //   // ),
      //   backgroundColor: Colors.grey[850],
      // ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // _printData(),
          _showTask(),
        ],
      ),
    );
  }

  // Widget _printData(){
  //   return _taskController.getTask();
  // }
  _showTask() {
    return Expanded(
      child: Obx(
        () {
          // _taskController.getTask();
          return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              // print('hello world');
              print(_taskController.taskList.length);
              // _taskController.getTask();
              return AnimationConfiguration.staggeredList(
                position: index,
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("tapped");
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const AddDetail()));
                        },
                        onLongPress: () {
                          print("tappedbbbb");
                          _showBottomSheet(context, _taskController.taskList[index]);
                        },
                        child: TaskTile(_taskController.taskList[index]),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
  _showBottomSheet(BuildContext context, Task task){
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: /*task.isCompleted == 1?MediaQuery.of(context).size.height * 0.24 :*/
            MediaQuery.of(context).size.height * 0.32,
          color: Colors.grey[850],
      ),
    );
  }
}
