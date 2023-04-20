import 'package:flutter/material.dart';
import 'package:internship_fair/models/getjob_api.dart';
import 'package:internship_fair/screens/JobProfile.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:internship_fair/constants/constants.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  bool _isChecked = false;
  bool _isCorrected = false;
  SfRangeValues _values = const SfRangeValues(2000.0, 12000.0);
  int low = 2000, high = 12000;

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
                  icon: Icon(Icons.arrow_back_ios_new_outlined,
                      color: blackColor),
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
                      padding: EdgeInsets.only(
                          right: size.width * 0.62, bottom: size.height * 0.01),
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
                labelFormatterCallback:
                    (dynamic actualValue, String formattedText) {
                  var formattedText = NumberFormat.compactCurrency(
                    symbol:
                        '₹', // if you want to add currency symbol then pass that in this else leave it empty.
                    decimalDigits: 0,
                  ).format(actualValue);
                  return ' $formattedText';
                },
                showDividers: true,
                // showTicks: true,
                enableTooltip: true,
                tooltipTextFormatterCallback:
                    (dynamic actualValue, String formattedText) {
                  actualValue = actualValue.round() - actualValue.round() % 500;
                  return actualValue.toStringAsFixed(00);
                },

                inactiveColor: darkgrey,
                activeColor: blackTeal,
                min: 2000,
                max: 12000,
                values: _values,
                interval: 2000,
                showLabels: true,
                onChanged: (SfRangeValues newValues) {
                  setState(() {
                    _values = newValues;
                  });
                  low = _values.start.round() - _values.start.round() % 500;
                  high = _values.end.round() - _values.end.round() % 500;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.5),
              child: Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       right: size.width * 0.63, bottom: size.height * 0.01),
                  //   child: const Text(
                  //     "COMPANY",
                  //     style: TextStyle(
                  //       fontFamily: 'Poppins',
                  //       fontWeight: FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(4.0),
                  //       border: Border.all(
                  //         width: 2.0,
                  //         color: blackTeal,
                  //       )),
                  //   child: TextField(
                  //     controller: _textEditingController2,
                  //   ),
                  // ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // Set the background color to transparent
                        elevation:
                            0, // Set the elevation to 0 to remove the shadow
                      ),
                      onPressed: () {
                        if ((_isCorrected == false && _isChecked == false) ||
                            (_isChecked == true && _isCorrected == true)) {
                          // GetJobApi().getJobData(low, high);
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (_) => JobProfile(
                                        low: low,
                                        high: high,
                                        mode: 'null',
                                      )));
                        } else if (_isCorrected == true &&
                            _isChecked == false) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (_) => JobProfile(
                                        low: low,
                                        high: high,
                                        mode: "Online",
                                      )));
                        } else if (_isChecked == true &&
                            _isCorrected == false) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (_) => JobProfile(
                                        low: low,
                                        high: high,
                                        mode: "Offline",
                                      )));
                        }
                      },
                      child: const FittedBox(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              color: Colors.teal),
                        ),
                      )),
                  SizedBox(
                    width: 150,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // Set the background color to transparent
                        elevation:
                            0, // Set the elevation to 0 to remove the shadow
                      ),
                      onPressed: () {
                        GetJobApi().getJobData(2000, 12000, 'null');
                      },
                      child: const FittedBox(
                        child: Text(
                          "Clear All",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              color: Colors.teal),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
