import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  
  final String initialText;
  final String titleText;
  final String buttonText;

  const AddTaskScreen({super.key, this.initialText = '', this.titleText = 'Add Task', this.buttonText = 'Add'});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
late String newTaskTitle;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    newTaskTitle = widget.initialText;
    controller = TextEditingController(text: widget.initialText);
  }

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
            controller: controller,
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
              if (controller.text.trim().isNotEmpty) {
                Navigator.pop(context, controller.text.trim());
              
            }
            }
          ),
          


        ],),
      ),
    );
  }
}