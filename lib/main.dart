import 'package:flutter/material.dart';
import 'package:qlhs/utils/storage.dart';
import 'package:qlhs/views/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Storage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
