import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modal/task_data.dart';
import 'constants.dart';

class TaskDescription extends StatelessWidget {
  final int index;
  TaskDescription({this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<TaskData>(context, listen: false).dbTasks[index]
              ['description'] ??
          "",
      style: kDescriptionTextStyle,
      overflow: TextOverflow.ellipsis,
    );
  }
}
