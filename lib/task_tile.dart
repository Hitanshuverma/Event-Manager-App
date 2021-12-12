import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/task.dart';

class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(task?.color ?? 0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task?.title ?? "",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Divider(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.black,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      // Text(
                      //   "${task!.startTime} - ${task!.endTime}",
                      //   style: GoogleFonts.lato(
                      //     textStyle:
                      //     TextStyle(fontSize: 13, color: Colors.grey[100]),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                      height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 60,
                    width: 0.5,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      task!.isCompleted == 1 ? "COMPLETED" : "EVENT",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.yellow;
      default:
        return Colors.yellow;
    }
  }
}