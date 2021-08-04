import 'package:app_learning/AddClass.dart';
import 'package:flutter/material.dart';

class AddSubmit extends StatefulWidget {
  AddSubmit({this.value});
  String? value;

  @override
  _AddSubmitState createState() => _AddSubmitState();
}

class _AddSubmitState extends State<AddSubmit> {
  String? sum;

  @override
  Widget build(BuildContext context) {
    String? num = '5';
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                sum = (widget.value!) + num;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddHome(output: sum)));
              },
              child: Text('Submit'))
        ],
      ),
    ));
  }
}
