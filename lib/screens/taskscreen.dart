import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/screens/add_task.dart';


class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}
  

class _TaskScreenState extends State<TaskScreen> {

   List<Task> tasks = [
    
  ];

  void removeTask(Task task){
    setState((){
      tasks.remove(task);

    });

  }

  void toggleTask(Task task) {
    setState(() {
      task.toggleDone();
    });
  }

  void updateTask(Task task, String newName){
    setState((){
      task.name = newName;

    });
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton:   FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () async {
          final newTaskTitle = await showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => AddTaskScreen());
          if (newTaskTitle != null ){
            setState(() {
              tasks.add(Task(name: newTaskTitle));

            }
            );
          }
        },
      ),
      body:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:EdgeInsets.only(top:30, left:30, right:30, bottom:30),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          
              children:<Widget> [
            CircleAvatar(
            backgroundColor: Colors.white, 
                    radius:30,
            child:Icon(Icons.list, size:30, color:Colors.lightBlueAccent),
          ),
          SizedBox(height: 10),
            Text('Todoey', style: TextStyle(color:Colors.white, fontSize:50, fontWeight: FontWeight.w700)),
            Text(
              '12 Tasks',
              style:TextStyle(color: Colors.white, fontSize: 20)
              
            ),
            
          ],
           
          ),
          ),
        Expanded(
              child: Container(
                padding:EdgeInsets.symmetric(horizontal:20),
                
                height:300,
                decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
              
                ),
              
              child: TaskList(tasks:tasks,
              toggleTask: toggleTask,
              removeTask:removeTask,
              updateTask:updateTask)
              ),
            )
        ],
        

      ),
    );
  }
}


