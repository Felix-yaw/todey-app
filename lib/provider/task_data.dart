import 'package:flutter/foundation.dart';
import 'package:todoey/helpers/db_helpers.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  TaskData() {
    loadTasksFromDB();
  }

  int get taskCount => tasks.length;
  int get finishedTasks => tasks.where((t) => t.isDone).length;
  int get unfinishedTasks => tasks.where((t) => !t.isDone).length;

  Future<void> loadTasksFromDB() async {
    final dbTasks = await DbHelper().getTasks();
    tasks = dbTasks.map((map) => Task.fromMap(map)).toList();
    notifyListeners();
  }

  Future<void> addTask(String name) async {
    int id = await DbHelper().insertTask(name);
    tasks.add(Task(id: id, name: name));
    notifyListeners();
  }

  Future<void> updateTask(Task task, String newName) async {
    task.name = newName;
    await DbHelper().updateTask(task.id!, task.name, task.isDone ? 1 : 0);
    notifyListeners();
  }

  Future<void> toggleTask(Task task) async {
    task.isDone = !task.isDone;
    await DbHelper().updateTask(task.id!, task.name, task.isDone ? 1 : 0);
    notifyListeners();
  }

  Future<void> removeTask(Task task) async {
    await DbHelper().deleteTask(task.id!);
    tasks.remove(task);
    notifyListeners();
  }
}
