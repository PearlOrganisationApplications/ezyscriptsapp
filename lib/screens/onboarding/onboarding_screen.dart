import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:ezyscripts/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity, // Full height of the screen
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white, Colors.green],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60,),
                Image.asset('assets/images/EzyScript1-155x108.png'),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'EzyScripts',
                  style: TextStyle(color: AppColors.primary, fontSize: 40),
                ),
                const Text(
                  'Connecting patients, doctors, and pharmacies on one platform. It provides comprehensive prescription management for better patient care.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const LoginScreen(),));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 160,
                  height: 50,
                  margin: EdgeInsets.only(right: 8.0), // Add margin between containers
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder:(context) => const Signup(),));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
                  ),
                  child: const Text(
                    'Signup',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),

    );
  }
}
