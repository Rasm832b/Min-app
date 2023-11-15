// ignore_for_file: prefer_const_constructors

import 'package:beginner_course/pages/AS1.dart';
import 'package:flutter/material.dart';

class AS2 extends StatelessWidget {
  const AS2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Fremmøde AS2',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      drawer: Drawer(
        width: 150,
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AS1');
                },
                child: Text(
                  'AS1',
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AS3');
                },
                child: Text(
                  'AS2',
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AS2');
                },
                child: Text(
                  'AS3',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text(
          'Under development. Back to AS1',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/AS1');
        },
      )),
    );
  }
}
