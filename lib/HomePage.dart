import 'package:app_learning/StyleText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({this.mail});
  String? first;
  String? last;
  String? mail;
  String? pass;
  String? dob;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getData() async {
    final data = await firestore.collection('Users').doc(widget.mail).get();
    print(data.data());

    widget.first = data['FirstName'];
    widget.last = data['LastName'];
    widget.dob = data['DOB'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Text('${widget.first}', style: title),
            Text('${widget.last}', style: title),
            Text('${widget.mail}', style: title),
            Text('${widget.pass}', style: title),
            Text('${widget.dob}', style: title),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    getData();
                  });
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }
}
