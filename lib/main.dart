// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:beginner_course/pages/AS1.dart';
import 'package:beginner_course/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:beginner_course/Functions/lister.dart';
import 'package:beginner_course/Functions/functioner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  await Hive.openBox('names');
 Functioner FunctionAS1 = Functioner();
 final name = Hive.box('names');
  if(name.isEmpty){
    for (var x = 0; x < FunctionAS1.namesAS1.length; x++) {
    name.add(FunctionAS1.namesAS1[x]);
    }
  }
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
        '/settings': (context) => Stettings(),
      },
    );
  }
}
