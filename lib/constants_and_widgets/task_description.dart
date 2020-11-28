import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todo_app/modal/tasks.dart';
import 'constants.dart';

class TaskDescription extends StatelessWidget {
  const TaskDescription({
    @required this.widget,
  });

  final TaskTile widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      tasks[widget.index].description ?? "",
      style: kDescriptionTextStyle,
      overflow: TextOverflow.ellipsis,
    );
  }
}
