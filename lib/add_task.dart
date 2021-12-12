import 'package:flutter/material.dart';


class Addtask extends StatelessWidget {
  const Addtask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
