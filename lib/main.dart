import 'package:app_learning/AddClass.dart';
import 'package:app_learning/Login.dart';
import 'package:app_learning/LoginPage.dart';
import 'package:app_learning/QuesPage.dart';
import 'package:app_learning/Register.dart';
import 'package:app_learning/SharedPref/SeesionRegister.dart';
import 'package:app_learning/StudentData.dart';
import 'package:app_learning/StudentMark.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: AddHome(),
    ),
  ));
}
