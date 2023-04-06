import 'package:flutter/material.dart';
import 'package:flutter_app_ex1/themes/my_theme.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme,
      home: const Home(),
    );
  }
}