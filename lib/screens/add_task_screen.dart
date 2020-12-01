import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants_and_widgets/constants.dart';
import 'package:todo_app/modal/task_data.dart';

Future<void> showAddTaskDialog({BuildContext context, int index: -1}) async {
  String _title;
  String _description;

  if (index != -1) {
    _title = Provider.of<TaskData>(context, listen: false).tasks[index].title;
    _description =
        Provider.of<TaskData>(context, listen: false).tasks[index].description;
    print('title: $_title, $_description');
  }

  return showDialog<void>(
    context: context,
    // barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        clipBehavior: Clip.hardEdge,
        scrollable: true,
        title: Text("Add Task"),
        elevation: 20,
        insetPadding: EdgeInsets.all(10),
        content: Column(
          children: [
            Theme(
              data: ThemeData(
                primaryColor: kYellowishColour,
              ),
              child: TextField(
                cursorColor: kYellowishColour,
                autofocus: true,
                maxLines: null,
                decoration: InputDecoration(
                  // prefixText: _title ?? "no",
                  focusColor: kYellowishColour,
                  hintText: "Title",
                  helperStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (value) => _title = value,
              ),
            ),
            Theme(
              data: ThemeData(
                primaryColor: kYellowishColour,
              ),
              child: TextField(
                cursorColor: kYellowishColour,
                autofocus: true,
                maxLines: null,
                decoration: InputDecoration(
                  // prefixText: _description ?? "",
                  focusColor: kYellowishColour,
                  hintText: "Description",
                  helperStyle: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onChanged: (value) => _description = value,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              child: Text('OK'),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(
                  title: _title,
                  description: _description,
                );
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
