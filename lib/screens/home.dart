import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Text(
          "Welcome to the Home page",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'poppins',
            color: blackTeal,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}