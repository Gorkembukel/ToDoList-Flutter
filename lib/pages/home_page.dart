
import 'package:flutter/material.dart';
import 'package:todolist/util/diolog_box.dart';
import 'package:todolist/util/todo_tile.dart';

class HomePage extends StatefulWidget{ 
  

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
//Text controller
  final _controller = TextEditingController();
  List toDoList = [
    ["Task 1", false],
    ["Make halay great again", false]
  ];

  void checkBoxChange(bool? value, int index){
    setState(() {
      toDoList[index][1] = value;
    });

  }

//save new task
void saveNewTask(){
  setState(() {
    toDoList.add(
      [_controller.text, false]
    );
  });
}
// create New task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop() ,);
        },
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('To Do'),        
        centerTitle: true,
        elevation: 10,
      ),
      body:ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              );
          },          
      ) 
      
    );
  }
}