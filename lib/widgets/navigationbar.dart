// import 'package:flutter/material.dart';

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
//       selectedColor: darkBlue,
//       unSelectedColor: Colors.black26,
//       backgroundColor: Colors.white,
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
//       enableLineIndicator: true,
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
