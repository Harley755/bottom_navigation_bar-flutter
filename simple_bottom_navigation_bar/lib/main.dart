import 'package:flutter/material.dart';
import 'package:simple_bottom_navigation_bar/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Bottom Navigation Bar',
      home: Home(),
    );
  }
}
