// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:beginner_course/Functions/functioner.dart';
import 'package:beginner_course/Functions/lister.dart';
import 'package:hive/hive.dart';

class AS1 extends StatefulWidget {
  const AS1({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<AS1> {
  Lister ListAS1 = Lister();
  Functioner FunctionAS1 = Functioner();
  final names = Hive.box('names');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            'Fremmøde AS1',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    Clipboard.setData(
                        ClipboardData(text: 'Fremmøde: ${FunctionAS1.result}'));
                  });
                },
                icon: Icon(Icons.copy)),
            IconButton(
                onPressed: () {
                  setState(() {
                    Clipboard.setData(ClipboardData(text: ''));
                    FunctionAS1.undo(FunctionAS1.result, FunctionAS1.checked);
                  });
                },
                icon: Icon(Icons.refresh)),
            //IconButton(onPressed: () async {}, icon: Icon(Icons.add))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  FunctionAS1.undo(FunctionAS1.result, FunctionAS1.checked);
                  FunctionAS1.editorMode = FunctionAS1.editorMode;
                  Navigator.pushNamed(context, '/settings');
                },
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < names.length; i++)
                Row(
                  children: [
                    Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          FunctionAS1.checked[i] = value ?? false;
                          if (FunctionAS1.checked[i] == true) {
                            FunctionAS1.result.add(FunctionAS1.names.getAt(i));
                          }
                          if (FunctionAS1.checked[i] == false) {
                            FunctionAS1.result.remove(names.getAt(i));
                          }
                        });
                      },
                      tristate: i == 1,
                      value: FunctionAS1.checked[i],
                    ),
                    Text(
                      '${names.getAt(i)}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
            ],
          ),
        )));
  }
}
