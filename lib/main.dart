import 'package:flutter/material.dart';
import 'package:learnchatapp/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: const Color(0xFF075E54),
        secondaryHeaderColor: const Color(0xFF128C7E),
      ),
      home: const HomeScreen(),
    );
  }
}
