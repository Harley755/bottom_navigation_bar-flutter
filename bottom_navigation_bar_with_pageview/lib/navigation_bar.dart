import 'package:bottom_navigation_bar_with_pageview/screens/call_screen.dart';
import 'package:bottom_navigation_bar_with_pageview/screens/chat_screen.dart';
import 'package:bottom_navigation_bar_with_pageview/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MenuNavigationBar extends StatefulWidget {
  const MenuNavigationBar({super.key});

  @override
  State<MenuNavigationBar> createState() => _MenuNavigationBarState();
}

class _MenuNavigationBarState extends State<MenuNavigationBar> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  void navigatorTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
      print(_page);
    });
  }

  List<Widget> pages = [
    const ChatScreen(),
    const CallScreen(),
    const ProfileScreen(),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: navigatorTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _page == 0
                ? const Icon(Icons.chat_bubble)
                : const Icon(Icons.chat_bubble_outline),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: _page == 1
                ? const Icon(Icons.phone)
                : const Icon(Icons.phone_outlined),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: _page == 2
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outlined),
            label: 'People',
          ),
        ],
      ),
    );
  }
}
