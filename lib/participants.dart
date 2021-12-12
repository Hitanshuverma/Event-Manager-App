import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled/add_participants.dart';
import 'package:get/get.dart';
import 'package:untitled/model/controllers/task_controller_event.dart';
import 'package:untitled/task_tile.dart';

import 'db/dbhelper_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelperEvent.initDb();
  //await GetStorage.init();
   Participants();
}
class Participants extends StatefulWidget {
  const Participants({Key? key}) : super(key: key);

  @override
  State<Participants> createState() => _ParticipantsState();
}

class _ParticipantsState extends State<Participants> {

  final _taskController = Get.put(TaskControllerEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: const Text('Participants'),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromRadius(15),
          child: Text(''),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _taskController.getTask();
          _showTask(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0xFF6364A7),
        child: const Icon(Icons.add),
        onPressed: () async {
          _taskController.getTask();
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddParticipant()));
        },
      ),
    );
  }
  _initialisedDb() async{
    // WidgetsFlutterBinding.ensureInitialized();
    await DBHelperEvent.initDb();
  }

  _showTask() {
    return Expanded(
      child: Obx(
            () {
          // _taskController.getTask();
          return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              // print('hello world');
              print('im operesed');
              print(_taskController.taskList.length);
              return Expanded(
                child: Container(
                  child : Text('new'),
                  color: Colors.blue,/*_taskController.taskList[index]*/),
              );
              // AnimationConfiguration.staggeredList(
              //   position: index,
              //   child: FadeInAnimation(
              //     child: Row(
              //       children: [
              //         GestureDetector(
              //           onTap: () {
              //             print("tapped");
              //             // Navigator.push(
              //             //     context, MaterialPageRoute(builder: (context) => const AddDetail()));
              //           },
              //           // onLongPress: () {
              //           //   print("tappedbbbb");
              //           //   _showBottomSheet(context, _taskController.taskList[index]);
              //           // },
              //           child:
              //         ),
              //       ],
              //     ),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
