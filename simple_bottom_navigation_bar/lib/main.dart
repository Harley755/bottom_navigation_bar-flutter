import 'package:simple_bottom_navigation_bar/screens/home_screen.dart';
import 'package:simple_bottom_navigation_bar/screens/notification_screen.dart';
import 'package:simple_bottom_navigation_bar/screens/profileScreen.dart';
import 'package:simple_bottom_navigation_bar/screens/search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List page = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Bar with PageView',
      home: Scaffold(
        body: page[currentIndex],
        bottomNavigationBar: buildNavigationBar(),
      ),
    );
  }

  Container buildNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: currentIndex,
        onTap: (value) => onTap(value),
        selectedItemColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? const Icon(Icons.home, size: 30.0)
                : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? const Icon(Icons.search, size: 30.0)
                : const Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? const Icon(Icons.notifications, size: 30.0)
                : const Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? const Icon(Icons.person, size: 30.0)
                : const Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
