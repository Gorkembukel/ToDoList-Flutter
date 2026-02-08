import 'package:flutter/material.dart';
import 'package:todolist/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  //init hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('myBox');



  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
      

    );
  }
  
}
