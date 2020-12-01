import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modal/task_data.dart';

class TaskScreenTopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: kCustomBoxShadow,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: InteractiveViewer(
                  child: Image(
                    image: AssetImage('images/Success.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tasks",
                    style: kBoldTextStyle,
                  ),
                  Text(
                    "${Provider.of<TaskData>(context).tasksDone}/${Provider.of<TaskData>(context).tasks.length}",
                    style: TextStyle(
                      color: kYellowishColour,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              LinearProgressIndicator(
                backgroundColor: kBackgroundColour,
                valueColor: AlwaysStoppedAnimation<Color>(kYellowishColour),
                value: Provider.of<TaskData>(context).tasks.length == 0
                    ? 1.0
                    : Provider.of<TaskData>(context).tasksDone /
                        Provider.of<TaskData>(context).tasks.length,
              )
            ],
          ),
        ),
      ],
    );
  }
}
