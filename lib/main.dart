import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FixMate());
}

class FixMate extends StatelessWidget {
  const FixMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FixMate",
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: const SplashScreen(),
    );
  }
}