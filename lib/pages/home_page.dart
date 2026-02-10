
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/pages/today_page.dart';

import 'package:todolist/util/diolog_box.dart';
import 'package:todolist/util/todo_tile.dart';

class HomePage extends StatefulWidget{ 
  

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{


  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //if this app opend firs ever
    if(_myBox.get('TODOLIST') == null){
      db.createInitialData();
    }else {
      //already exist data
      db.loadData();
    }
    super.initState();
  }

//Text controller
  final _controller = TextEditingController();
  

  void checkBoxChange(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = value;
    });
    db.updateDataBase();
  }

//save new task
void saveNewTask(){
  setState(() {
    db.toDoList.add(
      [_controller.text, false]      
    );
    _controller.clear();
    db.updateDataBase();
  });

  Navigator.of(context).pop();
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
    db.updateDataBase();
  }

//delete Task
  void deleteTask(int index ){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

//send to todays page
  void sendToTodaysPage(index){
    setState(() {
      db.todaysToDoList.add(db.toDoList.removeAt(index));
    });
    db.updateDataBase();
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
        actions: [
          MaterialButton(onPressed: ( ) {

            Navigator.push(
              context,
              MaterialPageRoute<void>(
                
                builder: (context) =>  TodayPage(),//TODO: her seferinde yeniden yaratılacak doğrusu bulunmalı
              ),
            );
          },

          )
        ],
        backgroundColor: Colors.teal,
        title: Text('To Do'),        
        centerTitle: true,
        elevation: 10,
      ),
      body:ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              isTodaysPage: false,
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFunction: (context) => deleteTask(index),
              sendToTodayFunction: (context) => sendToTodaysPage(index),
              );
          },          
      ) 
      
    );
  }
}