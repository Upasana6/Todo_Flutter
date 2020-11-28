import 'package:flutter/material.dart';
import 'package:todo_app/constants_and_widgets/task_tile.dart';
import 'package:todo_app/modal/tasks.dart';

import 'constants.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({@required this.widget});

  final TaskTile widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      tasks[widget.index].title ?? "",
      style: kTitleTextStyle,
      overflow: TextOverflow.ellipsis,
    );
  }
}
