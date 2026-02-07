
import 'package:flutter/material.dart';
import 'package:todolist/util/todo_tile.dart';

class HomePage extends StatefulWidget{ 

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text('To Do'),
        centerTitle: true,
        elevation: 10,
      ),
      body: ListView(
        children: [
          ToDoTile(),
        ],
      ),
    );
  }
}