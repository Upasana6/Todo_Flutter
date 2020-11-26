import 'package:flutter/material.dart';
import 'package:todo_app/screens/tasks_screen.dart';

class OpeningScreen extends StatefulWidget {
  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 16,
              child: Image(
                image: AssetImage('images/Report.png'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "Track your activities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Accomplish your goals.\nTest yourself and share with friends.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16,
                ),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(_createRoute(controller));
                    //   Navigator.of(context).pushNamed('/tasks_screen');
                  },
                  color: Color(0xfffed46c),
                  child: Text("Let's Go"),
                ),
              ),
            ),
            Expanded(
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute(AnimationController controller) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => TasksScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end)..animate(controller);
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
