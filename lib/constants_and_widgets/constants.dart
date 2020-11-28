import 'package:flutter/material.dart';

const Color kYellowishColour = Color(0xfffed46c);
const Color kBackgroundColour = Color(0xffeaeaea);
const Color kShadowColour = Color(0xffcacaca);
const Color kShadowColourObesity = Color(0xeecacaca);
const TextStyle kBoldTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
const List<BoxShadow> kCustomBoxShadow = <BoxShadow>[
  BoxShadow(
    color: kShadowColour,
    blurRadius: 5,
    spreadRadius: 15,
  ),
];
const List<Color> kColoursList = [
  Color(0xff307351),
  Color(0xffe06c9f),
  Color(0xff86cd82),
  Color(0xfffc440f),
  Color(0xff433a3f),
];
const TextStyle kTitleTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 20,
  fontWeight: FontWeight.w500,
  letterSpacing: 1,
);
const TextStyle kDescriptionTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 18,
  fontWeight: FontWeight.w400,
  wordSpacing: 2,
  letterSpacing: 0.5,
);
