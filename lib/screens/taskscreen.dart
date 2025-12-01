import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/screens/add_task.dart';
import 'package:todoey/provider/task_data.dart';
import 'package:provider/provider.dart';


class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final unfinishedTasks = context.watch<TaskData>().unfinishedTasks;
    final finishedTasks = context.watch<TaskData>().finishedTasks;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton:   FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () async {
            final newTaskTitle = await showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
            if (newTaskTitle != null ){
              
                context.read<TaskData>().addTask(newTaskTitle);
      
            }
              
            }
        
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
                '$finishedTasks Task Undone',
                style:TextStyle(color: Colors.white, fontSize: 20),
              
                
              ),
      
              Text('$unfinishedTasks Tasks Done', style:TextStyle(color: Colors.white, fontSize: 20)),
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
                
                child: TaskList()
                ),
              )
          ],
          
      
        ),
      ),
    );
  }
}


