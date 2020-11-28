import 'package:flutter/material.dart';
import 'package:todo_app/constants_and_widgets/add_task_button.dart';
import 'package:todo_app/constants_and_widgets/constants.dart';
import 'package:todo_app/constants_and_widgets/task_screen_top_container.dart';
import 'package:todo_app/constants_and_widgets/task_tile.dart';
import 'package:todo_app/modal/tasks.dart';

class TasksScreen extends StatelessWidget {
  final double tasksDone = 4 / 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColour,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 12,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: kShadowColour,
                ),
                child: TaskScreenTopContainer(tasksDone: tasksDone),
              ),
            ),
            // SizedBox(height: 5),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     decoration: BoxDecoration(a

            //       borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(30),
            //         bottomRight: Radius.circular(30),
            //       ),
            //       color: kShadowColour.withOpacity(0.3),
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 30,
              child: ListView.builder(
                itemBuilder: (context, itemCount) {
                  return TaskTile(
                    index: itemCount,
                  );
                },
                itemCount: tasks.length,
              ),
            ),
            Expanded(
              flex: 6,
              child: AddTaskButton(),
            ),
          ],
        ),
      ),
    );
  }
}
