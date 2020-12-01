import 'package:flutter/material.dart';

import 'constants.dart';

class VerticalDividerWidget extends StatelessWidget {
  final index;
  VerticalDividerWidget({this.index});

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
            color: kColoursList[index ?? 1],
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ],
    );
  }
}
