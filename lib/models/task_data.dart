import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [Task(name: 'Milk')];

  void addTask(Task t) {
    tasks.add(t);
    notifyListeners();
  }

  void changeStatus(int t, bool value) {
    tasks[t].isCompleted = value;
    notifyListeners();
  }

  void deleteTask(int task) {
    tasks.removeAt(task);
    notifyListeners();
  }
}
