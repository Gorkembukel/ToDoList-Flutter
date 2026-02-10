import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/util/diolog_box.dart';
import 'package:todolist/util/todo_tile.dart';

class TodayPage extends StatefulWidget {

  @override 
  State<TodayPage> createState() => _TodayPageState();
}


class _TodayPageState extends State<TodayPage> {

 final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //if this app opend firs ever
    if(_myBox.get('TODAYSTODOLIST') == null){
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
      db.todaysToDoList[index][1] = value;
    });
    db.updateDataBase();
  }

//save new task
void saveNewTask(){
  setState(() {
    db.todaysToDoList.add(
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
      db.todaysToDoList.removeAt(index);
    });
    db.updateDataBase();
  }
//send to todays page
  void sendToTodaysPage(index){
    setState(() {
      db.todaysToDoList.add(db.toDoList.remove(index));
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
        backgroundColor: Colors.teal,
        title: Text('ToDays To Do '),        
        centerTitle: true,
        elevation: 10,
      ),
      body:ListView.builder(
          itemCount: db.todaysToDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              isTodaysPage: true,
              taskName: db.todaysToDoList[index][0],
              taskCompleted: db.todaysToDoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFunction: (context) => deleteTask(index),
              sendToTodayFunction: (context) => sendToTodaysPage(index),
              );
          },          
      ) 
      
    );
  }
}