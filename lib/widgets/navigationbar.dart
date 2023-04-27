
import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';


class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  MyBottomNavigationBar({
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: size.width,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: size.height * 0.015,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                size: size.height * 0.042,
              ),
              onPressed: () => onTabTapped(0),
              color: currentIndex == 0 ? blackTeal : blackColor,
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              onPressed: () => onTabTapped(1),
              color: currentIndex == 1 ? blackTeal : blackColor,
            ),

            SizedBox(width: size.width * 0.2),
            // FloatingActionButton(
            //   onPressed: () {
            //     // TODO: Add onPressed functionality for the logo button.
            //   },
            //   backgroundColor: Colors.white,
            //   child: Image.asset(
            //     'assets/image/acm_logo.png',
            //     height: 30.0,
            //     width: 30.0,
            //   ),
            //   elevation: 0,
            // ),
            IconButton(
              icon: Icon(Icons.receipt),
              onPressed: () => onTabTapped(2),
              color: currentIndex == 2 ? blackTeal : blackColor,
            ),
            IconButton(
              icon: Icon(Icons.credit_card),
              onPressed: () => onTabTapped(3),
              color: currentIndex == 3 ? blackTeal : blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
