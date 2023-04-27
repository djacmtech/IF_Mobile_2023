import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/order_history_api.dart';
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:internship_fair/screens/cart.dart';
import 'package:internship_fair/screens/summary.dart';
import 'package:internship_fair/widgets/navigationbar.dart';

class OrderhistoryPage extends StatefulWidget {
  const OrderhistoryPage({Key? key});

  @override
  _OrderhistoryPageState createState() => _OrderhistoryPageState();
}

class _OrderhistoryPageState extends State<OrderhistoryPage> {
  List<bool> _isExpandedList = List.filled(10, false);
  List<List<bool>> _isExpandedCList = List.generate(
    10,
    (index) => List.filled(5, false),
  );
  var orderData;
  void getOrderHistory() async {
    // String status = '';

    try {
      orderData = await getHistory();
      print(orderData);
    } on Exception catch (e) {
      // Loader.hide();
      print(e);
    }
    // Loader.hide();
  }

  @override
  void initState() {
    // TODO: implement initState
    getOrderHistory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add onPressed functionality for the logo button.
        },
        backgroundColor: Colors.white,
        child: Image.asset(
          'assets/images/acm_logo.png',
          height: size.width * 0.75,
          width: size.width * 0.75,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 2,
          onTabTapped: (int ind) {
            if (ind == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobProfile()),
              );
            } else if (ind == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCart()),
              );
            } else if (ind == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderhistoryPage(),
                  ));
            } else if (ind == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            }
          }),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'ORDER HISTORY',
          style: TextStyle(color: blackColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
          iconSize: sizefont * 1.5,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: ListView.builder(
        itemCount: orderData["data"][0]["jobs"]
            .length, // replace with actual number of orders
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order ${index + 1}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sizefont * 1.2,
                              color: blackColor),
                        ),
                        IconButton(
                          icon: Icon(
                            _isExpandedList[index]
                                ? Icons.expand_less
                                : Icons.expand_more,
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
                    // visible: _isExpandedList[index],
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            child: ListView.builder(
                              itemCount: orderData["data"][0]["jobs"].length,
                              itemBuilder: (context, i) {
                                // For company card
                                return Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: Container(
                                    width: size.width * 0.8,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(height: 10),
                                            Text(
                                              '${orderData["data"][i]["jobs"][i]["company"]}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: blackTeal),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '${orderData["data"][i]["jobs"][i]["role"]}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: blackColor),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '₹${orderData["data"][i]["jobs"][i]["stipend"]}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: blackColor),
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                ),
                                                Text(
                                                  '${orderData["data"][i]["jobs"][i]["duration"]}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: blackColor),
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                ),
                                                Text(
                                                  '${orderData["data"][i]["jobs"][i]["location"]}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: blackColor),
                                                ),
                                              ],
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
    );
  }
}
