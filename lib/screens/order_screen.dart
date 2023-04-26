import 'dart:convert';
import 'package:internship_fair/models/getcart_model.dart' as data;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:internship_fair/screens/cart.dart';
import 'package:internship_fair/screens/summary.dart';
import 'package:internship_fair/widgets/navigationbar.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  // late Future<List<Order>> _orders;

  @override
  void initState() {
    super.initState();
    //_orders = _fetchOrders();
  }

  _fetchOrders() async {}

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sizefont = size.width * 0.07;
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
          onTabTapped: (int index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobProfile(
                        // low: 2000,
                        // high: 12000,
                        // mode: 'null',
                        )),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCart()),
              );
            } else if (index == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderHistoryPage(),
                  ));
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            }
          }),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Order History',
          style: TextStyle(
            fontFamily: 'popins',
            color: Colors.white,
            fontSize: sizefont * 0.6,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: FutureBuilder(
        // future: _orders,
        builder: (context, snapshot) {
          // if (snapshot.hasData) {
          final orders = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
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
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: CartItemCard(
                        company: "Order ID",
                        status: "status: Delievered",
                        price: '₹50',
                        jobid: 5,
                        //_getCart![index].jobid,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
          // } else {
          //  return const Center(child: Text('No orders to display.'));
          // }
        },
      ),
    );
  }
}

class Order {
  final String name;
  final String status;
  final double total;

  Order(this.name, this.status, this.total);
}

class CartItemCard extends StatelessWidget {
  final String company;

  final String price;
  final int jobid;
  final String status;

  const CartItemCard({
    required this.company,
    required this.status,
    required this.price,
    required this.jobid,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sizefont = size.width * 0.07;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizefont * 0.5),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade400),
        ),
        child: ListTile(
            // leading: CircleAvatar(
            //  radius: 25,
            // ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  style: TextStyle(
                    fontSize: sizefont * 0.8,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(
                  height: sizefont * 0.99,
                ),
                Text(
                  '$status',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '$price',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            )),
      ),
    );
  }
}
