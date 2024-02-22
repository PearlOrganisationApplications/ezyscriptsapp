import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text('Contact Us', style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
             const  Text('Ezyscript inc\nSt. Louis, Mo, 63141, United States of America',
                style: TextStyle(
                fontSize: 14,
              ),),
              const SizedBox(height: 10,),
              const  Text('Email Id:',
                style: TextStyle(
                  fontSize: 14,
                ),),
              const  Text('user@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                ),),
              const SizedBox(height: 10,),
              const  Text('Website:',
                style: TextStyle(
                  fontSize: 14,
                ),),
              const  Text('www.wzyscript.com',
                style: TextStyle(
                  fontSize: 14,
                ),),
             const SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Container(
                   height: 40,
                   width: 120,
                   decoration: BoxDecoration(
                     color: AppColors.primary,
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: const Center(
                     child : Text(
                       'Help Center',
                       style: TextStyle(color: Colors.white, fontSize: 16 ),
                     )
                   ),
                 ),
                 Container(
                   height: 40,
                   width: 120,
                   decoration: BoxDecoration(
                       color: AppColors.primary,
                       borderRadius: BorderRadius.circular(10)
                   ),
                   child: const Center(
                       child : Text(
                         'Feed Back',
                         style: TextStyle(color: Colors.white, fontSize: 16 ),
                       )
                   ),
                 )
               ],
             )
            ]
          ),
        ),
      ),
    );
  }
}
