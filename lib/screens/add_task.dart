import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  
  final String initialText;
  final String titleText;
  final String buttonText;

  const AddTaskScreen({super.key, this.initialText = '', this.titleText = 'Add Task', this.buttonText = 'Add'});


  @override
  Widget build(BuildContext context) {
    String newTaskTitle = initialText;
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
            controller: TextEditingController(text: initialText),
            onChanged: (newText){
              newTaskTitle = newText;
            },
          ),
          SizedBox(height: 20),
          TextButton(
           
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              foregroundColor: Colors.white
            ),
             child: Text('Add'),
           
            
            onPressed: () {
              Navigator.pop(context, newTaskTitle);
              
            },
          ),
          


        ],),
      ),
    );
  }
}