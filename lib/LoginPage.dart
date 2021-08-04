import 'package:app_learning/Home.dart';
import 'package:app_learning/RegisterPage.dart';
import 'package:app_learning/StyleText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.mail});
  String? mail;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  signIn() async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: _email.text, password: _password.text);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
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
            Text('LOGIN PAGE', style: title),
            TextField(
              controller: _email,
              decoration: InputDecoration(labelText: 'Email Id'),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      signIn();
                    },
                    child: Text('Login')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    child: Text('Sign Up'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
