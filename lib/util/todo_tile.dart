import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            //checkbox
            //Checkbox(value: value, onChanged: onChanged),
            // task name
            Text("Make halay great again"),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.teal,
        borderRadius: BorderRadius.circular(12)),
        
      ),
    );
  }
}