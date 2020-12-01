import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants_and_widgets/constants.dart';
import 'package:todo_app/modal/task_data.dart';

Future<void> showAddTaskDialog({BuildContext context, int index: -1}) async {
  TextEditingController _controllerTitle, _controllerDesc;
  String _title;
  String _description;

  if (index != -1) {
    _title = Provider.of<TaskData>(context, listen: false).tasks[index].title;
    _description =
        Provider.of<TaskData>(context, listen: false).tasks[index].description;
    print('title: $_title, $_description');
  }

  _controllerTitle = TextEditingController(text: _title ?? "");
  _controllerDesc = TextEditingController(text: _description ?? "");

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: AlertDialog(
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
                  controller: _controllerTitle,
                  cursorColor: kYellowishColour,
                  autofocus: true,
                  maxLines: null,
                  decoration: InputDecoration(
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
                  controller: _controllerDesc,
                  cursorColor: kYellowishColour,
                  autofocus: true,
                  maxLines: null,
                  decoration: InputDecoration(
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
                child: Text(
                  'OK',
                  style: TextStyle(color: kYellowishColour),
                ),
                onPressed: () {
                  index == -1
                      ? Provider.of<TaskData>(context, listen: false).addTask(
                          title: _title,
                          description: _description,
                        )
                      : Provider.of<TaskData>(context, listen: false)
                          .updateTask(
                          index: index,
                          title: _title,
                          description: _description,
                        );
                  _controllerDesc.dispose();
                  _controllerTitle.dispose();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
