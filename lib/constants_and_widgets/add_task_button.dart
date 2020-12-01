import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'constants.dart';

class AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          "\nAdd Task",
          textAlign: TextAlign.center,
          style: kBoldTextStyle.copyWith(fontSize: 25),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: kCustomBoxShadow,
          color: Colors.white,
        ),
      ),
      onTap: () {
        showAddTaskDialog(context: context);
      },
    );
  }
}
