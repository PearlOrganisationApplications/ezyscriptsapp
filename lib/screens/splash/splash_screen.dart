import 'package:ezyscripts/constant/images.dart';
import 'package:ezyscripts/screens/home/home_screen.dart';
import 'package:ezyscripts/screens/order/order_screen.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../controller/totalprice controller.dart';
import '../onboarding/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getToken();
    getTotalProducts();
    super.initState();
    // getCartDetils();
    Future.delayed(Duration(seconds: 20), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>  token==null?OnBoardScreen():HomeScreen(),
        ),
      );
    }); // Closing parenthesis was missing here
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
                 AppImages.kLogo, // Replace with your image asset path
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
