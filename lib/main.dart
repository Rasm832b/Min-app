// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:beginner_course/pages/AS1.dart';
import 'package:beginner_course/pages/AS2.dart';
import 'package:beginner_course/pages/AS3.dart';
import 'package:beginner_course/pages/AS4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AS1(),
      routes: {
        '/AS1': (context) => AS1(),
        '/AS2': (context) => AS2(),
        '/AS3': (context) => AS3(),
        '/AS4': (context) => AS4(),
      },
    );
  }
}
