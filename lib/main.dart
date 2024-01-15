import 'package:flutter/material.dart';
import 'package:todoapp/pages/home.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do",
      home: HomePage(),
    ); //MaterialApp
  }
}

