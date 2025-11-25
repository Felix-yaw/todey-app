import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';


class TaskList extends StatefulWidget {
  

  
  final List<Task> tasks;
  final Function(Task) toggleTask;  
  final Function(Task) removeTask;
  final Function(Task, String) updateTask;
  const TaskList({super.key, required this.tasks, required this.toggleTask, required this.removeTask, required this.updateTask});

  @override
  State<TaskList> createState() => _TaskListState();
}
  

class _TaskListState extends State<TaskList> {

  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
  return ListView(
    children: widget.tasks.map((task) {
      return TaskTile(
        taskTitle: task.name,
        isChecked: task.isDone,
        toggleCheckBoxState: (_) => widget.toggleTask(task),
        removeTask: () => widget.removeTask(task),
        updateTask: (newName) => widget.updateTask(task, newName),
      
          );
    }).toList(),
    );
}
}
