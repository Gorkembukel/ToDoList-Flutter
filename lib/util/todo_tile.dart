import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  void Function(BuildContext)? deleteFunction;
  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(left: 25,top: 25,right: 25),
      child: Slidable(        
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,)]
          ),
        child: Container(
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: this.taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                 ),
              // task name
              Text(
                this.taskName,
                style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.teal,
          borderRadius: BorderRadius.circular(12)),
          
        ),
      ),
    );
  }
}