import 'package:app_learning/StyleText.dart';
import 'package:flutter/material.dart';

class StudentMark extends StatefulWidget {
  StudentMark(
      {this.buss,
      this.comp,
      this.maths,
      this.sci,
      this.section,
      this.sID,
      this.social,
      this.std,
      this.stuName});

  String? stuName;
  String? sID;
  String? std;
  String? section;
  String? maths;
  String? sci;
  String? social;
  String? comp;
  String? buss;

  @override
  _StudentMarkState createState() => _StudentMarkState();
}

class _StudentMarkState extends State<StudentMark> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Student Mark Sheet',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Student Name :',
                      style: title,
                    ),
                    Text(
                      '${widget.stuName}',
                      style: subTitle,
                    ),
                    SizedBox(width: 50),
                    Text(
                      'Student ID :',
                      style: title,
                    ),
                    Text(
                      '${widget.sID}',
                      style: subTitle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Class :',
                      style: title,
                    ),
                    Text(
                      '${widget.std}',
                      style: subTitle,
                    ),
                    SizedBox(width: 130),
                    Text(
                      'Section :',
                      style: title,
                    ),
                    Text(
                      '${widget.section}',
                      style: subTitle,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Table(
                    textDirection: TextDirection.ltr,
                    border: TableBorder.all(width: 1.0),
                    children: [
                      TableRow(children: [
                        Text('Subject', style: title, textScaleFactor: 1.5),
                        Text('Marks', style: title, textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Text('Maths', style: subTitle, textScaleFactor: 1.3),
                        Text('${widget.maths}',
                            style: subTitle, textScaleFactor: 1.3)
                      ]),
                      TableRow(children: [
                        Text('Science', style: subTitle, textScaleFactor: 1.3),
                        Text('${widget.sci}',
                            style: subTitle, textScaleFactor: 1.3)
                      ]),
                      TableRow(children: [
                        Text('Social', style: subTitle, textScaleFactor: 1.3),
                        Text('${widget.social}',
                            style: subTitle, textScaleFactor: 1.3)
                      ]),
                      TableRow(children: [
                        Text('Computer', style: subTitle, textScaleFactor: 1.3),
                        Text('${widget.comp}',
                            style: subTitle, textScaleFactor: 1.3)
                      ]),
                      TableRow(children: [
                        Text('Business', style: subTitle, textScaleFactor: 1.3),
                        Text('${widget.buss}',
                            style: subTitle, textScaleFactor: 1.3)
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
