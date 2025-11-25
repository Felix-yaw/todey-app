import 'package:flutter/material.dart';
import 'package:todoey/screens/add_task.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? toggleCheckBoxState; 
  final Function() removeTask;
  final Function(String newName) updateTask;

  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.toggleCheckBoxState,
    required this.removeTask,
    required this.updateTask

    
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: toggleCheckBoxState,
      ),
      onLongPress:removeTask,
      onTap: () async{
        final String? updatedText = await showModalBottomSheet(context: context, builder: (context)=> AddTaskScreen(
          initialText: taskTitle,
          titleText: 'Update Task',
          buttonText: 'Update'
        
        ));
        
        if (updatedText != null){
          updateTask(updatedText);
        }
        
      },
    );
  }
}
