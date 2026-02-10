import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList = [];
  List todaysToDoList = [];
  //referance box

  final _myBox = Hive.box('myBox');

// Run this metot if first time ver you opening app
  void createInitialData(){
    toDoList = [
      ['Give us 5 star',false]
    ];
    todaysToDoList = [
      ['Give us 5 star',false]
    ];
  }
  //load data
  void loadData(){
    toDoList = _myBox.get('TODOLIST');
    todaysToDoList = _myBox.get('TODAYSTODOLIST')?? [];
  }

  void updateDataBase(){
    _myBox.put('TODOLIST', toDoList);
    _myBox.put('TODAYSTODOLIST', todaysToDoList);

  }

}