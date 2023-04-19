import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:internship_fair/constants/constants.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class MyCustomIconData extends IconData {
  const MyCustomIconData(int codePoint)
      : super(
          codePoint,
          fontFamily: 'Poppins',
        );
}

class _FilterState extends State<Filter> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  bool _isChecked = false;
  bool _isCorrected = false;
  SfRangeValues _values = const SfRangeValues(3000.0, 10000.0);
  @override
  Widget build(BuildContext context) {
    // double _currentValue = 5000.0;
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
                  iconSize: sizefont * 1.5,
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(width: size.width * 0.2),
                const Icon(Icons.filter_alt_sharp, color: Colors.teal),
                const SizedBox(width: 6.0),
                const Text(
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
              padding: EdgeInsets.only(top: size.width * 0.07),
              child: Padding(
                padding: const EdgeInsets.all(28.5),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.62, bottom: size.height * 0.01),
                      child: const Text(
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
                        border: Border.all(
                          width: 2.0,
                          color: blackTeal,
                        ),
                      ),
                      child: TextField(
                        controller: _textEditingController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: size.width * 0.7,
                top: 15.0,
              ),
              child: const Text(
                "STIPEND",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.958,
              child: SfRangeSlider(
                labelFormatterCallback: (dynamic actualValue, String formattedText) {
                  var formattedText = NumberFormat.compactCurrency(
                    decimalDigits: 2,
                    symbol: '₹', // if you want to add currency symbol then pass that in this else leave it empty.
                  ).format(actualValue);
                  return ' $formattedText';
                },
                min: 2000,
                max: 10000.0,
                values: _values,
                interval: 2000.0,
                showLabels: true,
                onChanged: (SfRangeValues newValues) {
                  setState(() {
                    _values = newValues;
                  });
                },
              ),
            ),
            // SliderTheme(
            //   data: SliderThemeData(
            //     thumbColor: Colors.teal,
            //     activeTrackColor: Colors.teal,
            //     inactiveTrackColor: Colors.grey,
            //     overlayColor: Colors.teal.withOpacity(0.2),
            //     trackHeight: 4.0,
            //     thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
            //     overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
            //     valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            //     valueIndicatorColor: Colors.teal,
            //     valueIndicatorTextStyle: const TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   child: Slider(
            //     value: _currentValue,
            //     min: 3000.0,
            //     max: 10000.0,
            //     divisions: 5,
            //     label: _currentValue.round().toString(),
            //     onChanged: (double value) {
            //       setState(() {
            //         _currentValue = value;
            //       });
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(28.5),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.63, bottom: size.height * 0.01),
                    child: const Text(
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
                        border: Border.all(
                          width: 2.0,
                          color: blackTeal,
                        )),
                    child: TextField(
                      controller: _textEditingController2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.05),
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
                        const Text(
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
                    padding: EdgeInsets.only(right: size.width * 0.5),
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
                        const Text(
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
              padding: EdgeInsets.only(left: size.width * 0.71),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Set the background color to transparent
                    elevation: 0, // Set the elevation to 0 to remove the shadow
                  ),
                  onPressed: () {},
                  child: const FittedBox(
                    child: Text(
                      "Clear All",
                      style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, color: Colors.teal),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
