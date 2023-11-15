// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AS1 extends StatefulWidget {
  const AS1({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<AS1> {
  void undo(List x, List y) {
    x.clear();
    for (int i = 0; i < y.length; i++) {
      y[i] = false;
    }
  }

  bool toggleall = false;
  List<bool> checked = List.generate(50, (index) => false);
  List result = [];
  List<String> names = [
    "Anna ",
    "Asger",
    "Astrid",
    "Camilla Frost",
    "Caroline",
    "Cecilie Frost",
    "Christian",
    "Christoffer",
    "Emma",
    "Fenja",
    "Gustav",
    "Helena Bach",
    "Helena Elling",
    "Inas",
    "Karoline",
    "Kristian",
    "Lars",
    "Louise",
    "Luanna",
    "Mathias",
    "Mathilde",
    "Morten",
    "Sebastian",
    " Sol",
    "Thea"
  ];

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
                        ClipboardData(text: 'Fremmøde: ${result}'));
                  });
                },
                icon: Icon(Icons.copy)),
            IconButton(
                onPressed: () {
                  setState(() {
                    Clipboard.setData(ClipboardData(text: ''));
                    undo(result, checked);
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
              for (var i = 0; i < names.length; i += 1)
                Row(
                  children: [
                    Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          checked[i] = value ?? false;
                          if (checked[i] == true) {
                            result.add(names[i]);
                          }
                        });
                      },
                      tristate: i == 1,
                      value: checked[i],
                    ),
                    Text(
                      '${names[i]}',
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
