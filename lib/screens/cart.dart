import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/getcart_api.dart';
import 'package:internship_fair/models/getcart_model.dart' as data;

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
    cartCount = _getCart!.length;
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
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.07;

    return Scaffold(
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
            "IF CART ",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: sizefont,
                fontWeight: FontWeight.normal,
                color: Colors.black),
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
              return ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.019,
                      ),
                      Text(
                        'IF Company list',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: sizefont * 0.60,
                            fontFamily: 'popins'),
                      ),
                      SizedBox(width: size.width * 0.47),
                      Text(
                        'Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: sizefont * 0.6),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.016),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartCount,
                    itemBuilder: (BuildContext context, int index) {
                      //Product item = cartItems[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.005,
                            vertical: size.width * 0.005),
                        child: Card(
                          color: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                            side: BorderSide(color: Colors.grey.shade400),
                          ),
                          child: ListTile(
                            leading: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                _getCart![index].logo,
                              ),
                            ),
                            title: Text(
                              _getCart![index].company,
                              style: const TextStyle(
                                  color: Color(0xFF187271),
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(_getCart![index].role),
                            trailing: Text(
                              '₹50',
                              style: TextStyle(fontSize: sizefont * 0.65),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF187271),
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
                  )
                ],
              );
            }
          }),
        ));
  }
}
