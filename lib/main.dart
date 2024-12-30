import 'package:flutter/material.dart';
import 'package:qlhs/views/home_screen.dart';
import 'package:qlhs/views/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
