import 'package:bottom_navigation_bar_with_pageview/navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Bar with Page View',
      home: MenuNavigationBar(),
    );
  }
}
