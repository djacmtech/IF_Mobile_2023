// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/getcart_api.dart';
import 'package:internship_fair/models/getcart_model.dart' as data;
import 'package:internship_fair/models/order_history_api.dart';
import 'package:internship_fair/models/removeCart.dart';
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:internship_fair/screens/order_screen.dart';
import 'package:internship_fair/screens/summary.dart';
import 'package:internship_fair/widgets/navigationbar.dart';
import 'package:motion_toast/motion_toast.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class Product {
  String name;
  String role;
  double price = 50.0;
  String image;

  Product({required this.name, required this.role, required this.image});
}

class _MyCartState extends State<MyCart> {
  List<data.Job>? _getCart = [];
  int? cartCount;

  void callback(int index) {
    setState(() {
      _getCart!.removeAt(index);
    });
  }

  getJob() async {
    _getCart = await CartAPI().getCart();
    cartCount = _getCart?.length;
    print(_getCart!.length);

    // print(_getCart![0].company);
  }

  @override
  void initState() {
    super.initState();

    // cartItems.add(itemToAdd);
    getJob();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sizefont = size.width * 0.07;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "IF CART",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: sizefont,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      body: FutureBuilder(
        future: getJob(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: blackTeal,
              ),
            );
          } else {
            return _getCart!.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your cart is empty :(",
                          style: TextStyle(
                            color: blackColor,
                            fontFamily: "poppins",
                            fontSize: sizefont * 0.8,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Get your interviews booked!",
                          style: TextStyle(
                            color: blackColor,
                            fontFamily: "poppins",
                            fontSize: sizefont * 0.5,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      //   child: Text(
                      //     'IF Company list',
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w500,
                      //       fontSize: sizefont * 0.60,
                      //       fontFamily: 'Poppins',
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: size.height * 0.01),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: cartCount,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: CartItemCard(
                                  company: _getCart![index].company,
                                  role: _getCart![index].role,
                                  logoUrl: _getCart![index].logo,
                                  price:
                                      "₹ ${_getCart![index].stipend.toString()}",
                                  jobid: _getCart![index].cartjob.jobId,
                                  index: index,
                                  callback: callback
                                  //_getCart![index].jobid,
                                  ),
                            );
                          },
                        ),
                      ),
                      if (_getCart!.length > 0)
                        Padding(
                          padding: EdgeInsets.only(
                              right: size.width * 0.05,
                              bottom: size.height * 0.05,
                              left: size.width * 0.03),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SummaryPage();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF187271),
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.029,
                                horizontal: size.width * 0.2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 5.0,
                              shadowColor: Colors.grey[800],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  color: Colors.white,
                                  size: sizefont * 0.85,
                                ),
                                SizedBox(width: size.width * 0.03),
                                Text(
                                  'Complete Payment',
                                  style: TextStyle(
                                    fontFamily: 'popins',
                                    color: Colors.white,
                                    fontSize: sizefont * 0.6,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
          }
        }),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String company;
  final String role;
  final String logoUrl;
  final String price;
  final int jobid;
  final int index;
  final Function(int index) callback;

  const CartItemCard(
      {super.key,
      required this.company,
      required this.role,
      required this.logoUrl,
      required this.price,
      required this.jobid,
      required this.index,
      required this.callback});

  void cartremove(BuildContext context, int jobid) async {
    final Size size = MediaQuery.of(context).size;
    final double sizefont = size.width * 0.04;
    Loader.show(context,
        progressIndicator: CircularProgressIndicator(color: blackTeal));
    String status = '';
    int userid = GetStorage().read("id");
    try {
      status = await removeFromCart(userid, jobid);
    } on Exception catch (e) {
      Loader.hide();
      print(e);
    }
    Loader.hide();

    if (status == "Success") {
      MotionToast.success(
        width: size.width * 0.7,
        height: 65,
        borderRadius: 10,
        padding: EdgeInsets.zero,
        title: Text(
          "Job removed",
          style: TextStyle(
              color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        description: Text(
          "Job successfully removed from Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: sizefont * 0.7,
          ),
        ),
      ).show(context);
      callback(index);
      // setState(() {

      // });
    } else if (status == "Job not in Cart") {
      MotionToast(
        primaryColor: darkgrey,
        width: size.width * 0.8,
        height: sizefont * 5,
        borderRadius: 10,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        title: Text(
          "Job not in Cart",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: sizefont * 0.8,
          ),
        ),
        description: Text(
          "Please add the job to the Card before removing it",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.black,
            fontSize: sizefont * 0.7,
          ),
        ),
      ).show(context);
    } else {
      MotionToast.error(
        height: sizefont * 5,
        borderRadius: 10,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        title: Row(
          children: [
            // Icon(
            //   Icons.error_outline,
            //   color: Colors.white,
            //   size: 24,
            // ),
            // SizedBox(width: 16),
            Text(
              "Could not remove from Cart",
              style: TextStyle(
                fontFamily: "Poppins",
                color: whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: sizefont * 0.9,
              ),
            ),
          ],
        ),
        description: Text(
          "Please check your internet connection and try again",
          style: TextStyle(
            fontFamily: "Poppins",
            color: whiteColor,
            fontSize: sizefont * 0.7,
          ),
        ),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sizefont = size.width * 0.04;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizefont * 0.5),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade400),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(logoUrl),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Wrap(
                children: [
                  Text(
                    role,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      company,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '$price',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete_outlined, color: blackColor),
              iconSize: sizefont * 1.5,
              onPressed: () {
                cartremove(context, jobid);

                //Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
