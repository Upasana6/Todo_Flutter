import 'package:flutter/material.dart';
import 'package:todo_app/constants_and_widgets/constants.dart';

Future<void> showMyDialog(BuildContext context) async {
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
                  focusColor: kYellowishColour,
                  hintText: "Title",
                  helperStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
                  focusColor: kYellowishColour,
                  hintText: "Description",
                  helperStyle: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
        // content: SingleChildScrollView(
        //   child: ListBody(
        //     children: <Widget>[
        //       Text(""),
        //     ],
        //   ),
        // ),
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
