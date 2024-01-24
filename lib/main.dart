import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:ezyscripts/screens/onboarding/onboarding_screen.dart';
import 'package:ezyscripts/screens/signup/signup_screen.dart';
import 'package:ezyscripts/screens/splash/splash_screen.dart';
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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white), // Set hamburger icon color to white
        ),
      ),
      home: SplashScreen(),
    );
  }
}

