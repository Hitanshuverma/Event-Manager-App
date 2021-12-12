import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/participants.dart';


class AddDetail extends StatelessWidget {
  const AddDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: const Text('Add Task'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  /*setState(() {
                    ChangeValue();
                    player.play("dice.mp3");
                  });*/
                },
                // child: Image.asset('images/dice.png'),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  color: Colors.transparent,
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Participants()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: const Center(
                    child: Text(
                      ' PARTICIPANTS ->',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const Divider(
              height: 20,
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  /*setState(() {
                    ChangeValue();
                    player.play("dice.mp3");
                  });*/
                },
                // child: Image.asset('images/dice.png'),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: const Center(
                    child: Text(
                      ' ATTENDEES ->',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  /*setState(() {
                    ChangeValue();
                    player.play("dice.mp3");
                  });*/
                },
                // child: Image.asset('images/dice.png'),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
