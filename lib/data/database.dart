import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList = [];

  //referance box

  final _myBox = Hive.box('myBox');

// Run this metot if first time ver you opening app
  void createInitialData(){
    toDoList = [
      ['Give us 5 star',false]
    ];

  }
  //load data
  void loadData(){
    toDoList = _myBox.get('TODOLIST');
  }

  void updateDataBase(){
    _myBox.put('TODOLIST', toDoList);
  }

}