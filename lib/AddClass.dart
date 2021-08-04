import 'package:app_learning/AddSubmit.dart';
import 'package:app_learning/StyleText.dart';
import 'package:flutter/material.dart';

class AddHome extends StatefulWidget {
  AddHome({this.output});
  String? output;

  @override
  _AddHomeState createState() => _AddHomeState();
}

class _AddHomeState extends State<AddHome> {
  TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _input,
              decoration: InputDecoration(labelText: 'Enter Input'),
            ),
            SizedBox(height: 20),
            Text('Output: ${widget.output}', style: subTitle),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddSubmit(value: _input.text)));
                },
                child: Text('Result'))
          ],
        ),
      ),
    ));
  }
}
