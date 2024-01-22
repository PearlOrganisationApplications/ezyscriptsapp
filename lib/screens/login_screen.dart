import 'package:flutter/material.dart';

import '../constant/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text('Login Here',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                color: AppColors.primary,
              )
            ],
          )
        ],
      ),
    );
  }
}
