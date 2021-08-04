import 'package:app_learning/StudentMark.dart';
import 'package:app_learning/StyleText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentData extends StatefulWidget {
  const StudentData({Key? key}) : super(key: key);

  @override
  _StudentDataState createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  List<Widget> markSheet = [];
  markData() async {
    final data = await firebase.collection("Student Details").get();
    for (final i in data.docs) {
      print(i['name']);
      Widget sheetMark = StudentMark(
        stuName: i['name'],
        sID: i['ID'],
        std: i['class'],
        section: i['section'],
        maths: i['Mmark'],
        sci: i['Smark'],
        social: i['Somark'],
        comp: i['Cmark'],
        buss: i['Bmark'],
      );
      markSheet.add(sheetMark);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: markSheet,
      ),
    );
  }
}
