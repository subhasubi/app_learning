import 'package:app_learning/SharedPref/SessionHome.dart';
import 'package:app_learning/StyleText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Gender { male, female }

class SessionRegister extends StatefulWidget {
  const SessionRegister({Key? key}) : super(key: key);

  @override
  _SessionRegisterState createState() => _SessionRegisterState();
}

class _SessionRegisterState extends State<SessionRegister> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Gender id = Gender.male;

  FirebaseAuth auth = FirebaseAuth.instance;
  register() async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);

    registerStore();
    setSessionTrue();
    print(userCredential);
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  registerStore() async {
    firestore.collection('User').doc(_email.text).set({
      'Name': _name.text,
      'Email': _email.text,
      'Password': _password.text,
      'Gender': id != 0 ? 'male' : 'female',
    });
  }

  setSessionTrue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future<bool> name = pref.setString('Name', _name.text);
    Future<bool> email = pref.setString('Email', _email.text);
    Future<bool> password = pref.setString('Password', _password.text);
    Future<bool> gender = pref.setString('Gender', id != 0 ? 'male' : 'female');
    clears();
  }

  clears() {
    _name.clear();
    _email.clear();
    _password.clear();
  }

  bool? visibilityPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue)),
            TextField(
              controller: _name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _password,
              obscureText: visibilityPassword!,
              decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibilityPassword = !visibilityPassword!;
                      });
                    },
                    icon: Icon(Icons.visibility_off),
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(70, 10, 50, 0),
              child: Row(
                children: [
                  Radio(
                      value: Gender.male,
                      groupValue: id,
                      onChanged: (Gender? value) {
                        setState(() {
                          id = value!;
                        });
                      }),
                  Text('male', style: subTitle),
                  SizedBox(width: 20),
                  Radio(
                      value: Gender.female,
                      groupValue: id,
                      onChanged: (Gender? value) {
                        setState(() {
                          id = value!;
                        });
                      }),
                  Text('female', style: subTitle)
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.fromLTRB(70, 10, 70, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        register();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SessionHome()));
                      },
                      child: Text('Register')),
                  ElevatedButton(
                      onPressed: () {
                        setSessionTrue();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SessionHome()));
                      },
                      child: Text('Home'))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
