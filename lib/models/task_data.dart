import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {

  List<Task> tasks = [
    
  ];
  List<Task> get task => tasks;

  void addTask(String title) {
    tasks.add(Task(name: title));
    notifyListeners();
  }

  void updateTask(task, String newText) {
    tasks[task].name = newText;
    notifyListeners();
  }
  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
  void toggleTask(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

}