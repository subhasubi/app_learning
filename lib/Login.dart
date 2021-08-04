import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  signUp() async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);
    print(userCredential);
  }

  signIn() async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: _email.text, password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _email,
                onChanged: (value) {
                  // setState(() {
                  //   value = _email.text;
                  //   print(value);
                  // });
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  signUp();
                },
                child: Text('Login')),
            ElevatedButton(
                onPressed: () {
                  signIn();
                },
                child: Text('SignIn'))
          ],
        ),
      ),
    );
  }
}
