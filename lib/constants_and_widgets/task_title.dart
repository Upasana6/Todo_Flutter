import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modal/task_data.dart';

import 'constants.dart';

class TaskTitle extends StatelessWidget {
  final int index;
  TaskTitle({this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<TaskData>(context, listen: false).tasks[index].title ?? "",
      style: kTitleTextStyle,
      overflow: TextOverflow.ellipsis,
    );
  }
}
