import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class filter extends StatefulWidget {
  const filter({super.key});

  @override
  State<filter> createState() => _filterState();
}

class MyCustomIconData extends IconData {
  const MyCustomIconData(int codePoint)
      : super(
          codePoint,
          fontFamily: 'Poppins',
        );
}

class _filterState extends State<filter> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  bool _isChecked = false;
  bool _isCorrected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.filter_alt_sharp, color: Colors.teal),
                ),
                SizedBox(width: 6.0),
                Text(
                  "Filters",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: const EdgeInsets.all(28.5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 280.0, bottom: 4.0),
                      child: Text(
                        "CATEGORY",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(width: 2.0)),
                      child: TextField(
                        controller: _textEditingController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 282.0, bottom: 12.0),
                    child: Text(
                      "COMPANY",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(width: 2.0)),
                    child: TextField(
                      controller: _textEditingController2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 260.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                          activeColor: Colors.teal,
                          checkColor: Colors.white,
                        ),
                        Text(
                          "Offline",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 260.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _isCorrected,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCorrected = value ?? false;
                            });
                          },
                          activeColor: Colors.teal,
                          checkColor: Colors.white,
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .transparent, // Set the background color to transparent
                    elevation: 0, // Set the elevation to 0 to remove the shadow
                  ),
                  onPressed: () {},
                  child: FittedBox(
                    child: Text(
                      "Clear All",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          color: Colors.teal),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
