import 'package:flutter/material.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'screens/opening_screen.dart';
import 'package:provider/provider.dart';
import 'modal/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => OpeningScreen(),
          '/tasks_screen': (context) => TasksScreen(),
        },
      ),
    );
  }
}
