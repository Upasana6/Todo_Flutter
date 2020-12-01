import 'package:flutter/foundation.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  int tasksDone = 0;

  void addTask({@required String title, @required String description}) {
    if (title != null || description != null) {
      tasks.add(Task(title: title, description: description, isDone: false));
      print(tasks.length);
      notifyListeners();
    }
  }

  void deleteTask({@required int index}) {
    if (index < tasks.length) {
      tasks.removeAt(index);
      notifyListeners();
    }
  }

  void updateTask(
      {@required int index,
      @required String title,
      @required String description}) {
    if (index > tasks.length) {
      // out of bound
      this.addTask(title: title, description: description);
    } else if (title == null || description == null) {
      deleteTask(index: index);
    } else {
      tasks[index].title = title;
      tasks[index].description = description;
      notifyListeners();
    }
  }

  void toggleDone({@required int index}) {
    if (index < tasks.length) {
      if (tasks[index].isDone) {
        tasks[index].isDone = false;
        tasksDone--;
      } else {
        tasks[index].isDone = true;
        tasksDone++;
      }
      notifyListeners();
    }
  }

  // void printing({int index}) {
  //   print(
  //       "${tasks[index].description} , ${tasks[index].title} , ${tasks[index].isDone}");
  // }
}
