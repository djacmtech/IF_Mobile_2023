import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';

const Color blackColor = Colors.black;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          'ORDER HISTORY',
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: ListView.builder(
        itemCount: 2, // replace with actual number of orders
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
                          'Order #${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isExpandedList[index]
                                ? Icons.expand_less
                                : Icons.expand_more,
                            size: 30,
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
                              itemCount: 1,
                              itemBuilder: (context, i) {
                                // For company card
                                return Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: Container(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(height: 10),
                                            Text(
                                              'Company Name',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Frontend Developer',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Stipend',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                ),
                                                Text(
                                                  'Duration',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                ),
                                                Text(
                                                  'Location',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
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
