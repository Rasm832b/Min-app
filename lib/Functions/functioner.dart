import 'package:beginner_course/pages/settings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class Functioner {
  var names = Hive.box('names');
  bool editorMode = false;
  void undo(List x, List y) {
    x.clear();
    for (int i = 0; i < y.length; i++) {
      y[i] = false;
    }
  }

  List<bool> checked = List.generate(100, (index) => false);
  List result = [];
  List edits = [];
  List<String> namesAS1 = [
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
  Adding(BuildContext context) {
    TextEditingController firstController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context,setState)=>AlertDialog(
          title: Text('Skriv navn'),
          content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  TextField(
                    controller: firstController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(labelText: 'Navn'),
                  ),
                ],
              )),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuller'),
            ),
            ElevatedButton(
              onPressed: () {
                // Use the values from the controllers
                String firstValue = firstController.text;

                names.add(firstValue[0].toUpperCase() + firstValue.substring(1));
                // Close the dialog
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Stettings()));
              },
              child: Text('Tilføj'),
            ),
          ],
        )
        )); 
      }


  editting(BuildContext context,int i) {
    TextEditingController firstController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
           return AlertDialog(
          title: Text('Skriv navn'),
          content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  TextField(
                    controller: firstController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(labelText: 'Navn'),
                  ),
                ],
              )),
          actions: <Widget>[
            ElevatedButton(onPressed: ()=> {names.deleteAt(i),
            Navigator.of(context).pop()}, 
            child: Text('Slet')),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuller'),
            ),
            ElevatedButton(
              onPressed: () {
                // Use the values from the controllers
                String firstValue = firstController.text;
                setState(() {
                names.putAt(i,firstValue[0].toUpperCase() + firstValue.substring(1));
                  
                });
                // Close the dialog
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Stettings()));
              },
              child: Text('Tilføj'),
            ),
          ],
        );
        });
       
      },
    );
  }
}

