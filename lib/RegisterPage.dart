import 'package:app_learning/LoginPage.dart';
import 'package:app_learning/StyleText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _conformPassword = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  signUp() async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);
    register();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  register() {
    firestore.collection('Users').doc(_email.text).set({
      'Username': _name.text,
      'Email Id': _email.text,
      'Password': _password.text,
      'ConformPassword': _conformPassword.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('REGISTER PAGE', style: title),
              TextField(
                controller: _name,
                decoration: InputDecoration(labelText: 'User Name'),
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(labelText: 'Email Id'),
              ),
              TextField(
                controller: _password,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              TextField(
                controller: _conformPassword,
                decoration: InputDecoration(labelText: 'Conform Password'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        signUp();
                      },
                      child: Text('Register')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                            builder: (context) =>
                                LoginPage(mail: _email.text)));
                      },
                      child: Text('Login'))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
