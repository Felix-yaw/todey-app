import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Color(0xff757575),
      child: Container(
              padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:Radius.circular(10))

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          SizedBox(height:20),
          Text('Add Task', textAlign: TextAlign.center, style: TextStyle(color:Colors.lightBlueAccent, fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height:10),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          TextButton(
            child: Text('Add'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              foregroundColor: Colors.white
            ),
           
            
            onPressed: () {
              
            },
          ),
          


        ],),
      ),
    );
  }
}