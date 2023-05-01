import 'package:flutter/material.dart';
import 'package:internship_fair/models/getjob_api.dart';
import 'package:internship_fair/screens/JobProfile.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:internship_fair/constants/constants.dart';

class Filter extends StatefulWidget {
  const Filter(
      {super.key,
      required this.callback,
      required this.low,
      required this.high,
      required this.online,
      required this.offline,
      required this.mode,
      required this.isChanged});

  final Function(int, int, bool, bool, String mode, bool isChanged) callback;
  final int low, high;
  final bool online, offline;
  final String mode;
  final bool isChanged;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _isChecked = false;
  bool _isCorrected = false;
  SfRangeValues _values = const SfRangeValues(0.0, 50000.0);
  int low = 0, high = 50000;

  @override
  void initState() {
    // TODO: implement initState
    // print("yash");
    super.initState();
    _isChecked = widget.offline;
    _isCorrected = widget.online;
    low = widget.low;
    high = widget.high;
    _values = SfRangeValues(widget.low.toDouble(), widget.high.toDouble());
    // print("Online" + _isCorrected.toString());
    // print("Offline" + _isChecked.toString());
    // print("low" + widget.low.toString());
    // print("high" + widget.high.toString());

    // low = widget.low;
    // high = widget.high;
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined,
                      color: blackColor),
                  iconSize: sizefont * 1.5,
                  onPressed: () => Navigator.pop(context),
                ),*/
                Icon(Icons.filter_alt_sharp, color: Colors.teal),
                SizedBox(width: size.width * 0.01),
                SizedBox(height: size.height * 0.12),
                Text(
                  "Filters",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: sizefont * 1.7,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: size.width * 0.013),
              child: Column(
                children: [
                  /* Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 0.62, bottom: size.height * 0.01),
                    child: const Text(
                      "CATEGORY",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),*/
                  /* Container(
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
                  ),*/
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: size.width * 0.68,
                // top: size.height * 0.02,
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
                    symbol: '₹', // if you want to add currency symbol then pass that in this else leave it empty.
                    decimalDigits: 0,
                  ).format(actualValue);
                  return ' $formattedText';
                },
                showDividers: true,
                // showTicks: true,
                enableTooltip: true,
                tooltipTextFormatterCallback: (dynamic actualValue, String formattedText) {
                  actualValue = actualValue.round() - actualValue.round() % 500;
                  return actualValue.toStringAsFixed(00);
                },

                inactiveColor: darkgrey,
                activeColor: blackTeal,
                min: 0,
                max: 50000,
                values: _values,
                interval: 10000,
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
            Column(
              children: [
                SizedBox(height: size.height * 0.05),
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
                  padding: EdgeInsets.only(
                    right: size.width * 0.7,
                    top: size.height * 0.0005,
                  ),
                  child: const Text(
                    "MODE",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.01),
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
                  padding: EdgeInsets.only(left: size.width * 0.01),
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.005,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Set the background color to transparent
                        elevation: 0, // Set the elevation to 0 to remove the shadow
                      ),
                      onPressed: () async {
                        // widget.callback(low, high, _isChecked, _isCorrected);
                        if ((_isCorrected == false && _isChecked == false) ||
                            (_isChecked == true && _isCorrected == true)) {
                          Navigator.pop(context);
                          // _getJob = await GetJobApi().getJobData(low, high, 'null');

                          widget.callback(low, high, _isCorrected, _isChecked, 'null', true);
                          // Navigator.pushReplacement(
                          //   context,
                          //   (MaterialPageRoute(
                          //     builder: (context) {
                          //       return JobProfile(
                          //         low: low,
                          //         high: high,
                          //         mode: 'null',
                          //       );
                          //     },
                          //   )),
                          // );
                          // GetJobApi().getJobData(low, high);
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //     builder: (_) => JobProfile(
                          //           low: low,
                          //           high: high,
                          //           mode: 'null',
                          //         )));
                        } else if (_isCorrected == true && _isChecked == false) {
                          Navigator.pop(context);
                          widget.callback(low, high, _isCorrected, _isChecked, 'Online', true);
                          // Navigator.pushReplacement(
                          //   context,
                          //   (MaterialPageRoute(
                          //     builder: (context) {
                          //       return JobProfile(
                          //         low: low,
                          //         high: high,
                          //         mode: "Online",
                          //       );
                          //     },
                          //   )),
                          // );
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //     builder: (_) => JobProfile(
                          //           low: low,
                          //           high: high,
                          //           mode: "Online",
                          //         )));
                        } else if (_isChecked == true && _isCorrected == false) {
                          Navigator.pop(context);
                          print("Hey Yash here");
                          widget.callback(low, high, _isCorrected, _isChecked, 'Offline', true);
                          // Navigator.pushReplacement(
                          //   context,
                          //   (MaterialPageRoute(
                          //     builder: (context) {
                          //       return JobProfile(
                          //         low: low,
                          //         high: high,
                          //         mode: "Offline",
                          //       );
                          //     },
                          //   )),
                          // );
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //     builder: (_) => JobProfile(
                          //           low: low,
                          //           high: high,
                          //           mode: "Offline",
                          //         )));
                        }
                      },
                      child: FittedBox(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              fontSize: sizefont * 1.11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              color: Colors.teal),
                        ),
                      )),
                  SizedBox(
                    width: size.width * 0.39,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Set the background color to transparent
                        elevation: 0, // Set the elevation to 0 to remove the shadow
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        widget.callback(0, 50000, false, false, 'null', true);
                      },
                      child: FittedBox(
                        child: Text(
                          "Clear All",
                          style: TextStyle(
                              fontSize: sizefont * 1.11,
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
