import 'package:flutter/foundation.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask({@required title, @required description}) {
    if (title != null || description != null) {
      tasks.add(Task(title: title, description: description));
      print(tasks.length);
      notifyListeners();
    }
  }

  void deleteTask({@required index}) {
    if (index < tasks.length) {
      tasks.removeAt(index);
      notifyListeners();
    }
  }

  void updateTask({@required index, @required title, @required description}) {
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
}
