import 'package:flutter/material.dart';
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
  List<data.Job>? _getJob = [];

  List<Product> cartItems = [];
  getJob() async {
    _getJob = await CartAPI().getCart();
    print(_getJob);
  }

  @override
  void initState() {
    super.initState();
    // Product itemToAdd = Product(
    //   name: 'COMPANY NAME',
    //   image:
    //       "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
    //   role: 'INTERNSHIP ROLE',
    // );

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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: blackTeal,
      //   onPressed: () {
      //     // Add a new item to the cartItems list
      //     setState(() {
      //       cartItems.add(Product(
      //         name: 'COMPANY NAME',
      //         image:
      //             'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
      //         description: 'INTERNSHIP ROLE',
      //         price: 50.0,
      //       ));
      //     });
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // body: _cartItems == null || _cartItems!.isEmpty
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.04, horizontal: size.width * 0.04),
          child: Column(
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
                        fontWeight: FontWeight.w500, fontSize: sizefont * 0.6),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.016),
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
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
                              cartItems[index].image,
                            ),
                          ),
                          title: Text(
                            cartItems[index].name,
                            style: const TextStyle(
                                color: Color(0xFF187271),
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(cartItems[index].role),
                          trailing: Text(
                            '₹${cartItems[index].price.toString()}',
                            style: TextStyle(fontSize: sizefont * 0.65),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   height: 300.0,
              //   //width: size.width*0.85,
              //   color: Colors.teal,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       const Text(
              //         "SUMMARY ",
              //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
              //         textAlign: TextAlign.left,
              //       ),
              //       const Divider(
              //         height: 20,
              //         thickness: 1,
              //         color: Colors.white,
              //       ),
              //       Row(
              //         children: [
              //           const Text(
              //             "  INTERVIEWS",
              //             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
              //             textAlign: TextAlign.left,
              //           ),
              //           SizedBox(
              //             width: size.width * 0.575,
              //           ),
              //           Text(
              //             '${cartItems.length}',
              //             style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
              //           ),
              //         ],
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(top: 20.0),
              //         child: Row(
              //           children: [
              //             const Text(
              //               "  TOTAL",
              //               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
              //               textAlign: TextAlign.left,
              //             ),
              //             SizedBox(
              //               width: size.width * 0.675,
              //             ),
              //             Text(
              //               '${cartItems.length * 50}',
              //               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const Divider(
              //         height: 20,
              //         thickness: 1,
              //         color: Colors.white,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(top: 10.0),
              //         child: Row(
              //           children: [
              //             const Text(
              //               "  Grand Total",
              //               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
              //               textAlign: TextAlign.left,
              //             ),
              //             SizedBox(
              //               width: size.width * 0.58,
              //             ),
              //             Text(
              //               '${cartItems.length * 50}',
              //               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const Padding(
              //         padding: EdgeInsets.only(top: 15.0),
              //         child: Text(
              //           " Note: Please pay the above amount through gpay to   UPID: 34235346536",
              //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
              //         ),
              //       ),
              //       ElevatedButton(
              //         onPressed: () async {
              //           FilePickerResult? result = await FilePicker.platform.pickFiles();
              //           if (result != null) {
              //             print(result.files.single.name);
              //             // Code to handle the picked file
              //           } // Code to handle file picking
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.white, // Set the background color of the button
              //         ),
              //         child: const Text(
              //           'Upload File',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ),
              //       ElevatedButton(
              //         onPressed: () {
              //           // Perform action when the button is pressed
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.white, // Set the background color of the button
              //           textStyle: const TextStyle(color: Colors.black), // Set the text color
              //         ),
              //         child: const Text(
              //           'Submit',
              //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ElevatedButton(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
