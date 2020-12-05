import 'package:flutter/foundation.dart';
import 'database_helper.dart';

class TaskData extends ChangeNotifier {
  int tasksDone = 0;
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> dbTasks = [];

  TaskData() {
    updateTaskDone();
  }

  void addTask(
      {@required String title,
      @required String description,
      bool isDone = false}) async {
    // print('title $title , desc $description');
    if (title != null || description != null) {
      Map<String, dynamic> row = {
        DatabaseHelper.columnIsDone: isDone ? 1 : 0,
        DatabaseHelper.columnTitle: title,
        DatabaseHelper.columnDescription: description,
      };
      await dbHelper.insert(row);
      queryUpdate();
      // print("Data : ");
      // printing();
      notifyListeners();
    }
  }

  void deleteTask({@required int index}) {
    if (index < dbTasks.length) {
      if (dbTasks[index]['isDone'] == 1) {
        tasksDone--;
      }

      // print('deleting ${dbTasks[index]['id']}');
      dbHelper.delete(dbTasks[index]['id']);
      queryUpdate();
      notifyListeners();
    }
  }

  void updateTask(
      {@required int index,
      @required String title,
      @required String description}) {
    if (index > dbTasks.length) {
      this.addTask(title: title, description: description);
    } else if (title == "" && description == "") {
      deleteTask(index: index);
    } else {
      dbHelper.update(title, description, dbTasks[index]['id']);
      queryUpdate();
      notifyListeners();
    }
  }

  void toggleDone({@required int index}) {
    if (index < dbTasks.length) {
      if (dbTasks[index]['isDone'] == 1) {
        tasksDone--;
        dbHelper.toggleIsDone(isDone: false, id: dbTasks[index]['id']);
        queryUpdate();
      } else {
        tasksDone++;
        dbHelper.toggleIsDone(isDone: true, id: dbTasks[index]['id']);
        queryUpdate();
      }
      notifyListeners();
    }
  }

  // void printing() {
  //   print("In printing");
  //   dbTasks.forEach((r) {
  //     print("${r['description']} , ${r['title']} , ${r['isDone']}");
  //   });
  // }

  Future<void> queryUpdate() async {
    dbTasks = await dbHelper.query();
    // print("Query Update");
    // printing();
    notifyListeners();
  }

  Future<void> updateTaskDone() async {
    await queryUpdate();
    dbTasks.forEach((row) {
      if (row['isDone'] == 1) {
        tasksDone++;
      }
    });
    // print('taskdone : $tasksDone');
    notifyListeners();
  }
}
