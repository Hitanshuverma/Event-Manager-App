import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:untitled/db/dbhelper_event.dart';
import 'package:untitled/model/controllers/task_controller_event.dart';
import 'package:untitled/model/task_event.dart';
import 'input_field.dart';
import 'model/controllers/task_controller.dart';
import 'model/task.dart';

class AddParticipant extends StatefulWidget {
  const AddParticipant({Key? key}) : super(key: key);

  @override
  State<AddParticipant> createState() => _AddParticipantState();
}

class _AddParticipantState extends State<AddParticipant> {
  final TextEditingController _eventController = TextEditingController();

  final TextEditingController _leaderController = TextEditingController();
  final TextEditingController _partController = TextEditingController();
  final TaskControllerEvent _taskController = Get.put(TaskControllerEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: const Text('Add Participant'),
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
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Inputfield(
                title: "Event",
                hint: "Enter title",
                controller: _eventController),
            Inputfield(
                title: "Leader",
                hint: "enter des",
                controller: _leaderController),
            Inputfield(
                title: "Participants",
                hint: "enter des",
                controller: _partController),
            const Divider(
              height: 10,
            ),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: const Color(0xFF6364A7),
        label: const Text('Add Participant'),
        icon: const Icon(Icons.add),
        onPressed: () {
          int valid = _validate();
          // _addToDB();
          if (valid == 1) {
            Navigator.pop(context,
                MaterialPageRoute(
                    builder: (context) => const AddParticipant()));
          }
        },
      ),
    );
  }
  int _validate() {
    if (_eventController.text.isNotEmpty && _leaderController.text.isNotEmpty) {
      print('if statement ');
      _addToDB();
      _taskController.getTask();
      return 1;
    } else {
      print('else statement ');
      // AlertDialog(
      //   title: const Text('AlertDialog Title'),
      //   content: SingleChildScrollView(
      //     child: ListBody(
      //       children: const <Widget>[
      //         Text('This is a demo alert dialog.'),
      //         Text('Would you like to approve of this message?'),
      //       ],
      //     ),
      //   ),
      //   actions: <Widget>[
      //     TextButton(
      //       child: const Text('Approve'),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //   ],
      // );
      return 0;
    }
  }

  _addToDB() async {
    int value = await _taskController.addTask(
      task_event: TaskEvent(
        // id: 1,
        event: _eventController.text,
        leader: _leaderController.text,
        team : _partController.text,
      ),
    );
    print(value);
  }
}
