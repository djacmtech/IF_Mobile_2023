import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/constants/constants.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:internship_fair/models/summary_model.dart' as SummaryClass;
import 'package:internship_fair/models/summary_api.dart' as SummaryFunction;

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryState();
}

class _SummaryState extends State<SummaryPage> {
  int? interviewCount;
  int? totalPrice;
  int? discount;
  int? credits;
  int? count;

  List<int> sum = [];

  getSummaryData() async {
    sum = SummaryFunction.SummaryApi().getSummaryInfo();
    print(sum[2]);
  }

  @override
  void initState() {
    // TODO: implement initState
    getSummaryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textgreen,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.1,
            MediaQuery.of(context).size.height * 0.05,
            MediaQuery.of(context).size.width * 0.1,
            MediaQuery.of(context).size.height * 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary',
              style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Interviews',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                new Spacer(),
                Text(
                  // _getSummary!.length.toString(),
                  '3',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.032,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                new Spacer(),
                Text(
                  credits.toString(),
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grand Total',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                new Spacer(),
                Text(
                  totalPrice.toString(),
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.036,
            ),
            Text(
              'Note :',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'Please pay the above amount',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            Text(
              'through gpay to',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            Text(
              'UPI ID:  34235346536',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Text(
              'Upload screenshot of payment',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: greyColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0625,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: blackColor),
              child: Center(
                  child: Text(
                'Submit',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
