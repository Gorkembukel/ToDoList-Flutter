import 'package:flutter/material.dart';
import 'package:todolist/util/my_button.dart';



class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel
    });
  //createTask

  void saveTask(String? taskName){


  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [            
              TextField(   
              controller: controller,           
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text("Enter task name here")
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "Save", onPressed: onSave),
                //cancel button
                MyButton(text: "Close", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}