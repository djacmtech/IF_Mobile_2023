// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class Product {
  String name;
  String description;
  double price;
  //String image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    //required this.image
  });
}

class _MyCartState extends State<MyCart> {
  List<Product> cartItems = [];
  @override
  void initState() {
    super.initState();
    Product itemToAdd = Product(
      name: 'COMPANY NAME',
      //image: "assets/images/Google.png",
      description: 'INTERNSHIP ROLE',
      price: 50.0,
    );
    cartItems.add(itemToAdd);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "IF CART ",
          style: TextStyle(fontFamily: 'Poppins', fontSize: 25, fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new item to the cartItems list
          setState(() {
            cartItems.add(Product(
              name: 'COMPANY NAME',
              //image: '',
              description: 'INTERNSHIP ROLE',
              price: 50.0,
            ));
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.04, horizontal: size.width * 0.04),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    //Product item = cartItems[index];
                    return Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                        side: BorderSide(color: Colors.grey.shade400),
                      ),
                      child: ListTile(
                        // leading: Image.network(
                        //   cartItems[index].image,
                        //   width: 100,
                        //   height: 70,
                        // ),
                        title: Text(
                          cartItems[index].name,
                          style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(cartItems[index].description),
                        trailing: Text(cartItems[index].price.toString()),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 300.0,
                //width: size.width*0.85,
                color: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "SUMMARY ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        const Text(
                          "  INTERVIEWS",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          width: size.width * 0.575,
                        ),
                        Text(
                          '${cartItems.length}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            "  TOTAL",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width: size.width * 0.675,
                          ),
                          Text(
                            '${cartItems.length * 50}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            "  Grand Total",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width: size.width * 0.58,
                          ),
                          Text(
                            '${cartItems.length * 50}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text(
                        " Note: Please pay the above amount through gpay to   UPID: 34235346536",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles();
                        if (result != null) {
                          print(result.files.single.name);
                          // Code to handle the picked file
                        } // Code to handle file picking
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Set the background color of the button
                      ),
                      child: const Text(
                        'Upload File',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform action when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Set the background color of the button
                        textStyle: const TextStyle(color: Colors.black), // Set the text color
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
