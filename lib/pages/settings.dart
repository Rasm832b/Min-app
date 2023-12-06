//import 'dart:html';

// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:beginner_course/Functions/functioner.dart';
import 'package:beginner_course/Functions/lister.dart';

class Stettings extends StatelessWidget {
  Stettings({super.key});

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
            IconButton(
                onPressed: () async {
                  print(names.toMap());
                },
                icon: const Icon(Icons.beach_access)),
            FloatingActionButton(
              onPressed: () async {
                await names.clear();
                setState(() {
                  for (var x = 0; x < names.length; x++) {
                    names.add(FunctionAS1.namesAS1[x]);
                  }
                  FunctionAS1.undo(FunctionAS1.edits, FunctionAS1.checked);
                });
              },
              backgroundColor: Colors.red[200],
              child: Icon(Icons.repeat),
            ),
            IconButton(
                onPressed: ()async {
                  await FunctionAS1.Adding(context);
                  setState(() {
                    
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
                    SizedBox(
                    child: Row(children: [
                      Padding(padding: EdgeInsets.only(right: 20),
                      child: Text('${names.getAt(i)}',
                      style: TextStyle(fontSize: 20),),
                      ),
                    FloatingActionButton(
                        onPressed: ()async {
                          await FunctionAS1.editting(context,i);
                          setState(() {});
                          },
                      child: Icon(Icons.edit),
                    ),
                    ]),
                    ),
                    
                  ],
                ),
            ]),
          ),
        ));
  }
}
