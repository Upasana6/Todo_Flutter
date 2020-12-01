import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants_and_widgets/constants.dart';
import 'package:todo_app/constants_and_widgets/task_title.dart';
import 'package:todo_app/constants_and_widgets/vertical_divider_widget.dart';
import 'package:todo_app/constants_and_widgets/task_description.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/modal/task_data.dart';

class TaskTile extends StatelessWidget {
  final int index;
  TaskTile({this.index});

  Future<void> _showMyDialog(BuildContext context) async {
    print(index);
    print("printed");
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: AlertDialog(
            title: Text(Provider.of<TaskData>(context, listen: false)
                .tasks[index]
                .title),
            elevation: 20,
            insetPadding: EdgeInsets.all(10),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(Provider.of<TaskData>(context, listen: false)
                      .tasks[index]
                      .description),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  child: Text(
                    "Delete",
                    style: TextStyle(color: kYellowishColour),
                  ),
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .deleteTask(index: index);
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: TextButton(
                  child: Text(
                    'Edit',
                    style: TextStyle(color: kYellowishColour),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    showAddTaskDialog(context: context, index: index);
                  },
                ),
              ),
              Center(
                child: TextButton(
                  child: Text(
                    'OK',
                    style: TextStyle(color: kYellowishColour),
                  ),
                  onPressed: () {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10.0),
      child: GestureDetector(
        onTap: () => _showMyDialog(context),
        child: Container(
            height: 120,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    SizedBox(width: 25),
                    VerticalDividerWidget(
                      index: index % 5,
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TaskTitle(
                              index: index,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TaskDescription(
                              index: index,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
