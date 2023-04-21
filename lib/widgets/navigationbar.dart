import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   static int _selectedIndex = 0; //default index
//   // Widget? _child;

//   List<Widget> _widgetOptions = [
//     Text('Home'),
//     Text('Status'),
//     Text('Job'),
//     Text('Bookmark'),
//     Text('Profile'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return CustomLineIndicatorBottomNavbar(
//       selectedColor: blackTeal,
//       unSelectedColor: Colors.black26,
//       backgroundColor: Colors.grey[100],

//       currentIndex: _selectedIndex,
//       unselectedIconSize: 25,
//       selectedIconSize: 30,
//       onTap: (index) {
//         setState(() {
//           _selectedIndex = index;
//           switch (index) {
//             case 0:
//               // _child = HomeScreen();
//               // Navigator.pushReplacement(context,
//               //     MaterialPageRoute(builder: (builder) => HomeScreen()));
//               print("Home");
//               break;
//             case 1:
//               // _child = HomePage();
//               // Navigator.pushReplacement(
//               //     context, MaterialPageRoute(builder: (builder) => StatusScreen()));
//               print("Status");
//               break;
//             case 2:
//               // _child = ProfilePage();
//               // Navigator.pushReplacement(context,
//               //     MaterialPageRoute(builder: (builder) => JobScreen()));
//               print("Job");
//               break;
//             case 3:
//               // _child = ProfilePage();
//               // Navigator.pushReplacement(context,
//               //     MaterialPageRoute(builder: (builder) => BookmarkScreen()));
//               print("Bookmark");
//               break;
//             case 4:
//               // _child = ProfilePage();
//               // Navigator.pushReplacement(context,
//               //     MaterialPageRoute(builder: (builder) => ProfileScreen()));
//               print("Profile");
//               break;
//           }
//         });
//       },
//       enableLineIndicator: false,
//       lineIndicatorWidth: 3,
//       indicatorType: IndicatorType.Top,
//       // gradient: LinearGradient(
//       //   colors: [Colors.pink, Colors.yellow],
//       // ),
//       customBottomBarItems: [
//         CustomBottomBarItems(
//           label: 'Home',
//           icon: Icons.home_rounded,
//         ),
//         CustomBottomBarItems(
//           label: 'Status',
//           icon: Icons.change_circle_rounded,
//         ),
//         CustomBottomBarItems(
//           label: 'Job',
//           icon: Icons.work_rounded,
//         ),
//         CustomBottomBarItems(
//           label: 'Bookmark',
//           icon: Icons.bookmark,
//         ),
//         CustomBottomBarItems(
//           label: 'Profile',
//           icon: Icons.account_circle,
//         ),
//       ],
//     );
//   }
// }
// import 'package:circle_nav_bar/circle_nav_bar.dart';
// import 'package:flutter/material.dart';

// class MyBottomNavBar extends StatefulWidget {
//   const MyBottomNavBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyBottomNavBar> createState() => _MyBottomNavBarState();
// }

// class _MyBottomNavBarState extends State<MyBottomNavBar>
//     with SingleTickerProviderStateMixin {
//   int _tabIndex = 1;
//   int get tabIndex => _tabIndex;
//   set tabIndex(int v) {
//     _tabIndex = v;
//     setState(() {});
//   }

//   late PageController pageController;

//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController(initialPage: _tabIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: CircleNavBar(
//         activeIcons: const [
//           // Icon(Icons.person, color: Colors.deepPurple),
//           Icon(Icons.home, color: Colors.deepPurple),
//           // Icon(Icons.favorite, color: Colors.deepPurple),
//         ],
//         inactiveIcons: const [
//           // Text("My"),
//           Text("Home"),
//           // Text("Like"),
//         ],
//         color: Colors.white,
//         height: 60,
//         circleWidth: 60,
//         activeIndex: 1,
//         // onTap: (index) {
//         //   tabIndex = index;
//         //   pageController.jumpToPage(tabIndex);
//         // },
//         padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
//         cornerRadius: const BorderRadius.only(
//           topLeft: Radius.circular(8),
//           topRight: Radius.circular(8),
//           bottomRight: Radius.circular(24),
//           bottomLeft: Radius.circular(24),
//         ),
//         shadowColor: Colors.deepPurple,
//         elevation: 10,
//       ),
//       body: PageView(
//         controller: pageController,
//         // onPageChanged: (v) {
//         //   // tabIndex = v;
//         // },
//         // children: [
//         //   Container(
//         //       width: double.infinity,
//         //       height: double.infinity,
//         //       color: Colors.red),
//         //   Container(
//         //       width: double.infinity,
//         //       height: double.infinity,
//         //       color: Colors.green),
//         //   Container(
//         //       width: double.infinity,
//         //       height: double.infinity,
//         //       color: Colors.blue),
//         // ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class MyBottomNavigationBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Scaffold(
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               // TODO: Add onPressed functionality for the logo button.
//             },
//             backgroundColor: Colors.white,
//             child: Image.asset(
//               'assets/images/acm_logo.png',
//               height: 50.0,
//               width: 50.0,
//             ),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: BottomAppBar(
//             shape: CircularNotchedRectangle(),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.home),
//                   onPressed: () {
//                     // TODO: Add onPressed functionality for the home button.
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     // TODO: Add onPressed functionality for the search button.
//                   },
//                 ),
//                 SizedBox(width: 50.0),
//                 IconButton(
//                   icon: Icon(Icons.notifications),
//                   onPressed: () {
//                     // TODO: Add onPressed functionality for the notifications button.
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.person),
//                   onPressed: () {
//                     // TODO: Add onPressed functionality for the profile button.
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

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
