import 'package:flutter/material.dart';


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
        final updatedText = await showDialog<String>(
    context: context,
    builder: (context) {
      TextEditingController controller = TextEditingController(text: taskTitle);

      return AlertDialog(
        title: Text("Update Task", style: TextStyle(color: Colors.lightBlue)),
        content: TextField(
          controller: controller,
          autofocus: true,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            child: Text("Cancel", style: TextStyle(color: Colors.lightBlueAccent)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text("Update", style: TextStyle(color: Colors.lightBlueAccent)),
            onPressed: () {
              Navigator.pop(context, controller.text.trim());
            },
          ),
        ],
      );
    },
  );

  // Update the task if the user entered something
  if (updatedText != null && updatedText.isNotEmpty) {
    updateTask(updatedText);
  }

        
        
      },
    );
  }
}
