import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_fair/constants/constants.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:internship_fair/models/payment.dart';
import 'package:internship_fair/models/summary_model.dart' as SummaryClass;
import 'package:internship_fair/models/summary_api.dart' as SummaryFunction;
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:motion_toast/motion_toast.dart';

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
  File? imageFile;
  PaymentController payment = PaymentController();
  String radiovalue = '';

  dynamic sum = [];
  //List<int> sum1 = [];

  getSummaryData() async {
    sum = await SummaryFunction.SummaryApi().getSummaryInfo();
    print("Yash" + sum[2].toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    getSummaryData();
    super.initState();
  }

  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void setRadioValue(value) {
    setState(() {
      radiovalue = value;
      print(radiovalue);
    });
  }

  @override
  Widget build(BuildContext context) {
    //sum = sum1.toList();
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;
    return Scaffold(
      backgroundColor: textgreen,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: whiteColor),
          iconSize: sizefont * 1.5,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Summary',
          style: TextStyle(fontFamily: 'poppins', fontSize: 27, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: blackTeal,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.059,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.1, 20, MediaQuery.of(context).size.width * 0.1, 25),
          child: FutureBuilder(
            future: sum.isEmpty ? getSummaryData() : null,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: whiteColor,
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [],
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.025,
                    // ),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Interviews',
                          style: TextStyle(
                              fontFamily: 'poppins', fontSize: 19, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          // _getSummary!.length.toString(),
                          sum[0].toString(),
                          // "2",
                          style: const TextStyle(
                              fontFamily: 'poppins', fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.032,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Discount',
                          style: TextStyle(
                              fontFamily: 'poppins', fontSize: 19, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          "₹ ${sum[2].toString()}",
                          // "2",
                          style: const TextStyle(
                              fontFamily: 'poppins', fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Grand Total',
                          style: TextStyle(
                              fontFamily: 'poppins', fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          "₹ ${sum[1].toString()}",
                          // "1",
                          style: const TextStyle(
                              fontFamily: 'poppins', fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.036,
                    ),
                    const Text(
                      'Note :',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Please pay the above amount',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'through gpay / paytm / cash',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'UPI ID:  ghardik5902@oksbi',
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose your payment method: ",
                          style: TextStyle(
                            color: whiteColor,
                            fontFamily: "poppins",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                activeColor: Colors.white,
                                value: 'UPI',
                                groupValue: radiovalue,
                                onChanged: (val) {
                                  setRadioValue(val);
                                }),
                            Text(
                              "UPI",
                              style: TextStyle(
                                color: whiteColor,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Radio(
                                activeColor: Colors.white,
                                value: 'Cash',
                                groupValue: radiovalue,
                                onChanged: (val) {
                                  setRadioValue(val);
                                }),
                            Text(
                              "Cash",
                              style: TextStyle(
                                color: whiteColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Upload screenshot of payment or photo of receipt',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    imageFile == null
                        ? Container(
                            // margin: EdgeInsets.all(12),
                            child: InkWell(
                              onTap: () {
                                _getFromGallery();
                              },
                              child: DottedBorder(
                                color: Colors.grey,
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(8),
                                dashPattern: [5, 3],
                                strokeWidth: 1,
                                child: Container(
                                  height: 150,
                                  // width: MediaQuery.of(context).size.width - 60,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Flexible(
                                        child: Text(
                                          "Upload Image",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "poppins",
                                            color: Colors.white,
                                          ),
                                          // fileName != null
                                          //     ? fileName!
                                          //     : 'Upload attachment',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            // margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              // borderRadius: BorderRadius.circular(20.0)
                              child: Container(
                                // margin: EdgeInsets.all(8),
                                // padding: EdgeInsets.all(25),
                                width: MediaQuery.of(context).size.width,
                                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                                child: Align(
                                  alignment: Alignment.center,
                                  heightFactor: 0.3,
                                  child: Image.file(
                                    imageFile!,
                                    fit: BoxFit.fill,
                                    // height: 150,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.08,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: greyColor),
                    // ),
                    if (imageFile != null)
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                imageFile = null;
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () async {
                        if (imageFile == null) {
                          MotionToast(
                            toastDuration: Duration(milliseconds: 500),
                            primaryColor: darkgrey,
                            width: size.width * 0.7,
                            height: 65,
                            borderRadius: 10,
                            padding: EdgeInsets.zero,
                            title: Text(
                              "Payment proof",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: sizefont * 0.8,
                              ),
                            ),
                            description: Text(
                              "Please upload payment proof",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontSize: sizefont * 0.7,
                              ),
                            ),
                          ).show(context);
                        } else if (radiovalue == '') {
                          MotionToast(
                            toastDuration: Duration(milliseconds: 500),
                            primaryColor: darkgrey,
                            width: size.width * 0.7,
                            height: 65,
                            borderRadius: 10,
                            padding: EdgeInsets.zero,
                            title: Text(
                              "Payment Mode",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: sizefont * 0.8,
                              ),
                            ),
                            description: Text(
                              "Please select a payment mode",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontSize: sizefont * 0.7,
                              ),
                            ),
                          ).show(context);
                        } else {
                          Loader.show(context, progressIndicator: CircularProgressIndicator(color: blackTeal));
                          String status = '';

                          try {
                            status = await payment.payment(radiovalue, imageFile!);
                          } on Exception catch (e) {
                            Loader.hide();
                            print(e);
                          }
                          Loader.hide();

                          if (status == "Success") {
                            Navigator.pop(context);
                            MotionToast.success(
                              toastDuration: Duration(seconds: 1),
                              width: size.width * 0.7,
                              height: 65,
                              borderRadius: 10,
                              padding: EdgeInsets.zero,
                              title: Text(
                                "Internship applied",
                                style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              description: Text(
                                "Internship applied successfully",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sizefont * 0.7,
                                ),
                              ),
                            ).show(context);
                          } else {
                            MotionToast.error(
                                toastDuration: Duration(seconds: 1),
                                height: 65,
                                borderRadius: 10,
                                // width: 400,
                                padding: EdgeInsets.zero,
                                title: Text(
                                  "Error",
                                  style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                description: Text(
                                  "Please check your internet connection",
                                  style: TextStyle(color: whiteColor),
                                )).show(context);
                          }
                        }
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: blackColor),
                        child: const Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
