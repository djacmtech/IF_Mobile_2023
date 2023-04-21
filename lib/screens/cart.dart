// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/getcart_api.dart';
import 'package:internship_fair/models/getcart_model.dart' as data;
import 'package:internship_fair/screens/summary.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
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
                    physics: BouncingScrollPhysics(),
                    itemCount: cartCount,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CartItemCard(
                          company: _getCart![index].company,
                          role: _getCart![index].role,
                          logoUrl: _getCart![index].logo,
                          price: '₹50',
                        ),
                      );
                    },
                  ),
                ),
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

  const CartItemCard({
    required this.company,
    required this.role,
    required this.logoUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sizefont = size.width * 0.07;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizefont*0.5),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade400),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(logoUrl),
          ),
          title: Text(
            role,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ), 
              ),
              SizedBox(
                height: sizefont*0.1,
              ),
              Text(
            '$price',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),)
            ],
          ),
          trailing: 
            IconButton(
              icon: Icon( Icons.delete_outlined, color: blackColor),
              iconSize: sizefont * 1.5,
              onPressed: () {
                //Navigator.of(context).pop();
                },
            ),
          ),
        ),
    );
  }
}
