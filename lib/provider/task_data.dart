import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {

  List<Task> tasks = [
    
  ];
  int get taskCount => tasks.length;
  
  int get finishedTasks => tasks.where((task) => !task.isDone).length;
  int get unfinishedTasks => tasks.where((task) => task.isDone).length;
  
  List<Task> get task => tasks;

  void addTask(String title) {
    tasks.add(Task(name: title));
    notifyListeners();
  }

  void updateTask(Task task, String newText) {
    task.name = newText;
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