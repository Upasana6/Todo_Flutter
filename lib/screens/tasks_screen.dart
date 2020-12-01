import 'package:flutter/material.dart';
import 'package:todo_app/constants_and_widgets/add_task_button.dart';
import 'package:todo_app/constants_and_widgets/constants.dart';
import 'package:todo_app/constants_and_widgets/task_screen_top_container.dart';
import 'package:todo_app/constants_and_widgets/task_tile.dart';
import 'package:todo_app/modal/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
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
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: kShadowColour,
                ),
                child: TaskScreenTopContainer(),
              ),
            ),
            Expanded(
              flex: 30,
              child: ListView.builder(
                itemBuilder: (context, itemCount) {
                  return TaskTile(
                    index: itemCount,
                  );
                },
                itemCount: Provider.of<TaskData>(context).tasks.length,
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
