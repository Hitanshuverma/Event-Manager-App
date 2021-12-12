import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:untitled/model/controllers/task_controller.dart';
import 'package:untitled/model/task.dart';
import 'input_field.dart';
import 'package:get/get.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  int _selectedRemind = 7;
  List<int> remindList = [
    1,
    3,
    5,
    7,
  ];
  int _selectedColor = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: const Text('Add Event'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const Divider(
          //   color: Colors.white,
          //   height: 8,
          //   thickness: 0.1,
          // ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              formatDate(_selectedDate, [MM, '  ', d, ', ', yyyy]),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 3, 0, 0),
            // child: Text(
            //     // '$_today_or_not()',
            //     style: const TextStyle(
            //       color: Colors.white,
            //     )),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 20),
            child: DatePicker(
              DateTime.now(),
              height: 80,
              width: 80,
              initialSelectedDate: DateTime.now(),
              monthTextStyle: const TextStyle(
                //fontSize: 20,
                color: Colors.grey,
              ),
              dayTextStyle: const TextStyle(
                //fontSize: 20,
                color: Colors.grey,
              ),
              dateTextStyle: const TextStyle(
                // fontSize: 20,
                color: Colors.grey,
              ),
              onDateChange: (date) {
                setState(() {
                  _selectedDate = date;
                });
                print(_selectedDate);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Inputfield(
                    title: "Title",
                    hint: "Enter Title",
                    controller: _titleController),
                Inputfield(
                    title: "Description",
                    hint: "Enter Description",
                    controller: _noteController),
                // const Inputfield(title: "Note", hint: "enter note"),
                Inputfield(
                  title: "Remind",
                  hint: "$_selectedRemind Days Early",
                  widget: DropdownButton(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    underline: Container(height: 0),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                    dropdownColor: Colors.grey[900],
                    icon: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ),
                    iconSize: 20,
                    // elevation: 5,
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()));
                    }).toList(),
                  ),
                ),
                const Divider(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          height: 5,
                        ),
                        const Text(
                          'Color',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Divider(
                          height: 5,
                        ),
                        Wrap(
                          children: List<Widget>.generate(3, (int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = index;
                                });
                                print(index);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: index == 0
                                      ? Colors.red
                                      : index == 1
                                          ? Colors.orange
                                          : Colors.yellow,
                                  child: _selectedColor == index
                                      ? const Icon(
                                          Icons.done,
                                          color: Colors.black,
                                          size: 20,
                                        )
                                      : Container(),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: const Color(0xFF6364A7),
        label: const Text('Add Event'),
        icon: const Icon(Icons.add),
        onPressed: () {
          int num = _validate();
          if (num == 1) {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Add()));
          }
        },
        // ),
      ),
    );
  }

  int _validate() {
    if (_titleController.text.isNotEmpty) {
      print('if statement ');
      _addToDB();
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
      task: Task(
        // id: 1,
        title: _titleController.text,
        des: _noteController.text,
        isCompleted: 0,
        date: formatDate(_selectedDate, [MM, '  ', d, ' ', yyyy]),
        color: _selectedColor,
        remind: _selectedRemind,
      ),
    );
    print(value);
  }
  // String _today_or_not() {
  //   String str = '';
  //   if (_selectedDate == DateTime.now()) {
  //     return('Today');
  //   }
  //   return ('');
  // }
  // _validateInput(){
  //   if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty){
  //     //add to database
  //     Navigator.pop(context, MaterialPageRoute(builder: (context) => Add()));
  //     Get.back();
  //   }else if(_titleController.text.isEmpty || _noteController.text.isEmpty){
  //     Get.snackbar(
  //         "Required",
  //         "All fields must be filled",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.white,
  //       icon: const Icon(Icons.warning_amber_rounded),
  //     );
  //   }
  //   else{
  //     print('blabla');
  //   }
  // }
}
