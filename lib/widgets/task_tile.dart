import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
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
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.taskTitle,
        style: TextStyle(
          decoration: widget.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: widget.isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: widget.toggleCheckBoxState,
      ),
      onLongPress: widget.removeTask,
      onTap: () async {
        if (widget.isChecked) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You cannot edit a completed task")),
          );
          return;
        }

        final updatedText = await showDialog<String>(
          context: context,
          builder: (context) {
            TextEditingController controller =
                TextEditingController(text: widget.taskTitle);

            return StatefulBuilder(
              builder: (context, setState) {
                bool isChanged = controller.text.trim() != widget.taskTitle.trim();

                return AlertDialog(
                  title: Text("Update Task", style: TextStyle(color: Colors.lightBlue)),
                  content: TextField(
                    controller: controller,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {}); // triggers rebuild, isChanged recalculated
                    },
                  ),
                  actions: [
                    TextButton(
                      child: Text("Cancel", style: TextStyle(color: Colors.lightBlueAccent)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text("Update", style: TextStyle(color: Colors.lightBlueAccent)),
                      onPressed: isChanged
                          ? () {
                              Navigator.pop(context, controller.text.trim());
                            }
                          : null,
                    ),
                  ],
                );
              },
            );
          },
        );

        if (updatedText != null && updatedText.isNotEmpty) {
          widget.updateTask(updatedText);
        }
      },
    );
  }
}
