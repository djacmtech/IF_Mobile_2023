import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/order_history_api.dart';
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:internship_fair/screens/cart.dart';
import 'package:internship_fair/screens/summary.dart';
// import 'package:internship_fair/widgets/navigationbar.dart';

class OrderhistoryPage extends StatefulWidget {
  const OrderhistoryPage({Key? key});

  @override
  _OrderhistoryPageState createState() => _OrderhistoryPageState();
}

class _OrderhistoryPageState extends State<OrderhistoryPage> {
  final List<bool> _isExpandedList = List.filled(100, false);

  dynamic orderData = [];
  getOrderHistory() async {
    // print("Yash");

    orderData = await getHistory();

    print(orderData);
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getOrderHistory();

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text(
            'Booked Interviews',
            style: TextStyle(color: blackColor),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
            iconSize: sizefont * 1.5,
            onPressed: () => Navigator.pop(context),
          ),
          // centerTitle: true,
          elevation: 0,
          // backgroundColor: Colors.grey[100],
          iconTheme: IconThemeData(color: blackColor),
        ),
        body: FutureBuilder(
            future: orderData.isEmpty ? getOrderHistory() : null,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: blackTeal,
                  ),
                );
              } else {
                return orderData.length == 0
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your interview cart is empty :(",
                              style: TextStyle(
                                color: blackColor,
                                fontFamily: "poppins",
                                fontSize: sizefont * 1.2,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              "Book your interviews!",
                              style: TextStyle(
                                color: blackColor,
                                fontFamily: "poppins",
                                fontSize: sizefont * 1,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.01),
                          Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: orderData.length, // replace with actual number of orders
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.042, vertical: size.height * 0.018),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(sizefont * 0.8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.036, vertical: size.height * 0.01),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Companies applied ${index + 1}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: sizefont * 1.2,
                                                    color: blackColor),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  _isExpandedList[index] ? Icons.expand_less : Icons.expand_more,
                                                  size: size.width * 0.09,
                                                  color: blackColor,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _isExpandedList[index] = !_isExpandedList[index];
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: _isExpandedList[index],
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(sizefont * 0.8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.3),
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            // alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.03, vertical: size.width * 0.01),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // SizedBox(
                                                //   height: size.height * 0.03,
                                                // ),
                                                Container(
                                                  height: size.height * 0.125 * orderData[index]["jobs"].length,
                                                  child: ListView.builder(
                                                    itemCount: orderData[index]["jobs"].length,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemBuilder: (context, i) {
                                                      // For company card
                                                      return Container(
                                                        height: size.height * 0.12,
                                                        alignment: Alignment.topLeft,
                                                        padding: const EdgeInsets.symmetric(
                                                          horizontal: 4,
                                                        ),
                                                        child: Container(
                                                          width: size.width * 0.8,
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  // SizedBox(height: 10),
                                                                  Text(
                                                                    '${orderData[index]["jobs"][i]["company"]}',
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: sizefont * 1.1,
                                                                        color: blackTeal),
                                                                  ),
                                                                  SizedBox(height: size.height * 0.012),
                                                                  Text(
                                                                    '${orderData[index]["jobs"][i]["role"]}',
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: sizefont,
                                                                        color: blackColor),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        '₹${orderData[index]["jobs"][i]["stipend"]}',
                                                                        style:
                                                                            TextStyle(fontSize: 14, color: blackColor),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 60,
                                                                      ),
                                                                      Text(
                                                                        orderData[index]["jobs"][i]["duration"] == null
                                                                            ? "Not Specified"
                                                                            : '${orderData[index]["jobs"][i]["duration"]}',
                                                                        style:
                                                                            TextStyle(fontSize: 14, color: blackColor),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 60,
                                                                      ),
                                                                      Text(
                                                                        '${orderData[index]["jobs"][i]["mode"]}',
                                                                        style:
                                                                            TextStyle(fontSize: 14, color: blackColor),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: size.height * 0.015,
                                                                  )
                                                                ],
                                                              ),
                                                              // SizedBox(
                                                              //   width: 125,
                                                              // ),
                                                              // IconButton(
                                                              //   icon: Icon(
                                                              //     _isExpandedCList[index][i]
                                                              //         ? Icons.expand_less
                                                              //         : Icons.expand_more,
                                                              //     size: 30,
                                                              //     color: blackColor,
                                                              //   ),
                                                              //   onPressed: () {
                                                              //     setState(() {
                                                              //       _isExpandedCList[index][i] =
                                                              //           !_isExpandedCList[index][i];
                                                              //     });
                                                              //   },
                                                              // ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
              }
            })));
  }
}
