import 'package:app_learning/StyleText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionHome extends StatefulWidget {
  const SessionHome({Key? key}) : super(key: key);

  @override
  _SessionHomeState createState() => _SessionHomeState();
}

class _SessionHomeState extends State<SessionHome> {
  String? userName = '';
  String? emailId = '';
  String? passwrd = '';
  String? genderValue = '';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic name = pref.getString('Name');
    dynamic email = pref.getString('Email');
    dynamic password = pref.getString('Password');
    dynamic gender = pref.getString('Gender');
    userName = name;
    emailId = email;
    passwrd = password;
    genderValue = gender;
  }

  setSessionFalse() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future<bool> name = pref.setString('Name', '');
    Future<bool> email = pref.setString('Email', '');
    Future<bool> password = pref.setString('Password', '');
    Future<bool> gender = pref.setString('Gender', '');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    getSession();
                    setSessionFalse();
                  });
                },
                icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('User').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                    );
                  } else {
                    List<Widget> userData = [];
                    final data = snapshot.data!.docs;
                    for (dynamic i in data) {
                      Widget value = Container(
                        width: double.infinity,
                        color: Colors.blue,
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text('Name: ${i['Name']}', style: subTitle),
                            Text('Email: ${i['Email']}', style: subTitle),
                            Text('Password: ${i['Password']}', style: subTitle),
                            Text('Gender: ${i['Gender']}', style: subTitle),
                          ],
                        ),
                      );
                      print(i.data());
                      userData.add(value);
                    }
                    return Column(
                      children: userData,
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
