import 'package:flutter/material.dart';


class TaskTile extends StatefulWidget {
  const TaskTile({super.key});
  
  @override
  State<TaskTile> createState() => _TaskTileState();
}
   bool isChecked = false;
class _TaskTileState extends State<TaskTile> {
 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task.'),
      trailing: TaskCheck()
        
    );
  }
}

class TaskCheck extends StatefulWidget {
  
   
  @override
  State<TaskCheck> createState() => _TaskCheckState();
}

class _TaskCheckState extends State<TaskCheck> {
  
  @override
  Widget build(BuildContext context) {
    return Checkbox(
    value: isChecked,
    activeColor: Colors.lightBlueAccent,
     onChanged: (newValue) {
      setState(() {
        isChecked = newValue!;
        
      });
      
    },);
      

  }
}

