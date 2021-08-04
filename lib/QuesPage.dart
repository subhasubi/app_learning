import 'package:app_learning/MapList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Option { DML, Query, Relational_Schema, DDL }

class QuesPage extends StatefulWidget {
  const QuesPage({Key? key}) : super(key: key);

  @override
  _QuesPageState createState() => _QuesPageState();
}

class _QuesPageState extends State<QuesPage> {
  Option id = Option.DML;

  List<Widget> quizContainer = [];
  quiz() {
    for (dynamic i in choose) {
      print(i['Question']);
      List<Widget> checkOption = [];

      for (dynamic j in i['Option']) {
        print(j);
        Widget cOption = ListTile(
          title: Text(
            '$j',
            style: TextStyle(fontSize: 15),
          ),
          leading: Radio(
              value: i['Option'],
              groupValue: id,
              onChanged: (dynamic value) {
                setState(() {
                  id = value!;
                });
              }),
        );
        checkOption.add(cOption);
      }

      Widget Question = Center(
        child: Container(
          height: 700,
          width: 390,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: Colors.black, style: BorderStyle.solid)),
          child: Column(
            children: [
              Text(
                'Choose the correct option:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                '${i['Question']}',
                style: TextStyle(fontSize: 18),
              ),
              Column(
                children: checkOption,
              ),
              SizedBox(height: 15),
              ElevatedButton(onPressed: () {}, child: Text('Continue'))
            ],
          ),
        ),
      );
      quizContainer.add(Question);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quiz();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Column(
          children: quizContainer,
        )
      ],
    ));
  }
}
