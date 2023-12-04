//import 'dart:html';

// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:beginner_course/Functions/functioner.dart';
import 'package:beginner_course/Functions/lister.dart';

class Stetings extends StatelessWidget {
  Stetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Changes();
  }
}

class Changes extends StatefulWidget {
  const Changes({super.key});

  @override
  State<Changes> createState() => _ChangesState();
}

class _ChangesState extends State<Changes> {
  Functioner FunctionAS1 = Functioner();
  var names = Hive.box('names');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Text('Settings'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  setState(() {
                    names.deleteAll(FunctionAS1.edits);
                    FunctionAS1.edits = [];
                    FunctionAS1.undo(FunctionAS1.edits, FunctionAS1.checked);
                  });
                },
                icon: const Icon(Icons.delete)),
            // IconButton(
            //     onPressed: () async {
            //       print(names.toMap());
            //     },
            //     icon: const Icon(Icons.beach_access)),
            // FloatingActionButton(
            //   onPressed: () async {
            //     await names.clear();
            //     setState(() {
            //       for (var x = 0; x < names.length; x++) {
            //         names.add(FunctionAS1.namesAS1[x]);
            //       }
            //       FunctionAS1.undo(FunctionAS1.edits, FunctionAS1.checked);
            //     });
            //   },
            //   backgroundColor: Colors.red[200],
            //   child: Icon(Icons.repeat),
            // ),
            IconButton(
                onPressed: () {
                  setState(() {
                    FunctionAS1.showInputPopup(context);
                  });
                },
                icon: Icon(Icons.add))
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
                FunctionAS1.editorMode = !FunctionAS1.editorMode;
                Navigator.pushNamed(context, '/AS1');
              },
              icon: Icon(Icons.home),
            )
          ],
        )),
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              for (var i = 0; i < names.length; i++)
                Row(
                  children: [
                    Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          FunctionAS1.checked[i] = value ?? false;
                          if (FunctionAS1.checked[i] == true) {
                            FunctionAS1.edits.add(names.keyAt(i));
                          }
                          if (FunctionAS1.checked[i] == false) {
                            FunctionAS1.edits.remove(names.keyAt(i));
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
                ),
            ]),
          ),
        ));
  }
}
