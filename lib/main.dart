import 'package:ezyscripts/screens/login_screen.dart';
import 'package:ezyscripts/screens/onboarding_screen.dart';
import 'package:ezyscripts/screens/signup_screen.dart';
import 'package:ezyscripts/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}

