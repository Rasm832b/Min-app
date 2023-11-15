// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AS4 extends StatelessWidget {
  const AS4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fremmøde AS4'),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AS1');
                },
                child: Text(
                  'AS1',
                  style: TextStyle(fontSize: 15),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AS2');
                },
                child: Text(
                  'AS2',
                  style: TextStyle(fontSize: 15),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AS3');
                },
                child: Text(
                  'AS3',
                  style: TextStyle(fontSize: 15),
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
