// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:beginner_course/Functions/functioner.dart';
import 'package:beginner_course/Functions/lister.dart';

class AS1 extends StatefulWidget {
  const AS1({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<AS1> {
  Lister ListAS1 = Lister();
  Functioner FunctionAS1 = Functioner();

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
                        ClipboardData(text: 'Fremmøde: ${ListAS1.result}'));
                  });
                },
                icon: Icon(Icons.copy)),
            IconButton(
                onPressed: () {
                  setState(() {
                    Clipboard.setData(ClipboardData(text: ''));
                    FunctionAS1.undo(ListAS1.result, ListAS1.checked);
                  });
                },
                icon: Icon(Icons.refresh)),
            // IconButton(
            //     onPressed: () {
            //       setState(() {
            //         if (toggleall == false) {
            //           for (int i = 0; i < checked.length; i++) {
            //             checked[i] = true;
            //           }
            //           toggleall = !toggleall;
            //         } else if (toggleall == true) {
            //           for (int i = 0; i < checked.length; i++) {
            //             checked[i] = false;
            //           }
            //           toggleall = !toggleall;
            //         }
            //       });
            //     },
            //     icon: Icon(Icons.favorite))
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
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
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/AS4');
                  },
                  child: Text(
                    'AS4',
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < ListAS1.namesAS1.length; i += 1)
                Row(
                  children: [
                    Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          ListAS1.checked[i] = value ?? false;
                          if (ListAS1.checked[i] == true) {
                            ListAS1.result.add(ListAS1.namesAS1[i]);
                          }
                        });
                      },
                      tristate: i == 1,
                      value: ListAS1.checked[i],
                    ),
                    Text(
                      '${ListAS1.namesAS1[i]}',
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
