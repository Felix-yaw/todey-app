import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/task_data.dart';


class TaskList extends StatefulWidget {
  
  

  
  
  const TaskList({super.key,} );

  @override
  State<TaskList> createState() => _TaskListState();
}
  

class _TaskListState extends State<TaskList> {

  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
  final taskData = context.watch<TaskData>();
  final tasks = taskData.tasks;
  return ListView(
    children: tasks.map((task) {
      return TaskTile(
        taskTitle: task.name,
        isChecked: task.isDone,
        toggleCheckBoxState: (_) => taskData.toggleTask(task),
        removeTask: () => taskData.removeTask(task),
        updateTask: (newName) => taskData.updateTask(task, newName),
      
          );
    }).toList(),
    );
}
}
