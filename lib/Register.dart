import 'package:app_learning/HomePage.dart';
import 'package:app_learning/StyleText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _dob = TextEditingController();

  FirebaseFirestore storage = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  signUp() async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);
    print(userCredential);
    register();
  }

  register() {
    storage.collection('Users').doc(_email.text).set({
      'FirstName': _firstname.text,
      'LastName': _lastname.text,
      'Email': _email.text,
      'Password': _password.text,
      'DOB': _dob.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register Page', style: title),
            TextField(
              controller: _firstname,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastname,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(labelText: 'Email id'),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: _dob,
              decoration: InputDecoration(labelText: 'DOB'),
            ),
            ElevatedButton(
                onPressed: () {
                  signUp();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(mail: _email.text)));
                },
                child: Text('Sign Up'))
          ],
        ),
      ),
    ));
  }
}
