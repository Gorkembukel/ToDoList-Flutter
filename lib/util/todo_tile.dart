import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  bool isTodaysPage;
  void Function(BuildContext)? deleteFunction;
  void Function(BuildContext)? sendToTodayFunction;
  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
    required this.sendToTodayFunction,
    required this.isTodaysPage,
    });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(left: 25,top: 25,right: 25),
      child: Slidable(    
        startActionPane: !isTodaysPage? ActionPane(//Todayspage içinde çalışmamalı
          motion: StretchMotion(), 
          children: [SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: sendToTodayFunction,
            icon: Icons.travel_explore, // TODO: can be change
            backgroundColor: Colors.amber )]
          ):null,    
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