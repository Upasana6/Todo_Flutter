import 'package:flutter/material.dart';
import 'constants.dart';

class TaskScreenTopContainer extends StatelessWidget {
  const TaskScreenTopContainer({
    Key key,
    @required this.tasksDone,
  }) : super(key: key);

  final double tasksDone;

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
                    "4/12",
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
                value: tasksDone,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
