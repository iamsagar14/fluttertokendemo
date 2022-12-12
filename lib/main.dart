import 'package:flutter/material.dart';
import 'package:fluttterdemowhive/screens/home_screen.dart';
import 'package:fluttterdemowhive/screens/login_screen.dart';
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
