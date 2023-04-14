import 'package:flutter/material.dart';
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:internship_fair/screens/filter_page.dart';
import 'package:internship_fair/screens/jobdesc.dart';
import 'package:internship_fair/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: JobProfile(),
    );
  }
}
