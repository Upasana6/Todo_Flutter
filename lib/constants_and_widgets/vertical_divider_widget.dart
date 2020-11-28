import 'package:flutter/material.dart';
import 'package:todo_app/constants_and_widgets/task_tile.dart';

import 'constants.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final TaskTile widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          height: 90,
          width: 9,
          decoration: BoxDecoration(
            color: kColoursList[widget.index ?? 1],
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ],
    );
  }
}
