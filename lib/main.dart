import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:internship_fair/screens/cart.dart';
import 'package:internship_fair/screens/filter_page.dart';
import 'package:internship_fair/screens/jobdesc.dart';
import 'package:internship_fair/screens/login.dart';
import 'package:internship_fair/splash_screen.dart';
import 'package:internship_fair/screens/summary.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JobProfile(),
    );
  }
}
