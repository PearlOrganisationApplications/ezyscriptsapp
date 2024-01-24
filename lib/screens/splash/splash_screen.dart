import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../onboarding/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds and then navigate to the login page
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OnBoardScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFADD8E6), // Light Blue
                Color(0xFF4169E1), // Dark Blue
              ],
              stops: [0.0, 0.7], // Adjust stops for smoother transitions
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/EzyScript1-155x108.png', // Replace with your image asset path
                  width: 150,
                  height: 150,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
