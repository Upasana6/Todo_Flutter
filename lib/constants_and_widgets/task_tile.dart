import 'package:flutter/material.dart';
import 'package:todo_app/constants_and_widgets/constants.dart';
import 'package:todo_app/constants_and_widgets/task_title.dart';
import 'package:todo_app/constants_and_widgets/vertical_divider_widget.dart';
import 'package:todo_app/constants_and_widgets/task_description.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/modal/tasks.dart';

class TaskTile extends StatefulWidget {
  final int index;
  TaskTile({this.index});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tasks[widget.index].title),
          elevation: 20,
          insetPadding: EdgeInsets.all(10),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(tasks[widget.index].description),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    print(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10.0),
      child: GestureDetector(
        onTap: _showMyDialog,
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
                    VerticalDividerWidget(widget: widget),
                    SizedBox(width: 25),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TaskTitle(widget: widget),
                          SizedBox(
                            height: 10,
                          ),
                          TaskDescription(widget: widget),
                        ],
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
