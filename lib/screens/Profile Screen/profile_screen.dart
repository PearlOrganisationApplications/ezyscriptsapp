import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Profile', style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: Column(
        children: [
          Center(child: CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: Image.asset('assets/images/profile.png'),
            ),
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('User Name', style: TextStyle(fontSize: 16, color: Colors.black),),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit))
            ],
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: 2,
          ),
          Container(
            child: Column(
              children: [
                Row()
              ],
            ),
          )
        ],
      ),
    );
  }
}
