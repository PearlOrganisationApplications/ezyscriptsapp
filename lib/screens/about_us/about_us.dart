import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text('About US', style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            children: [
             const  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('MISSION AND ', style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),),
                  Text('VALUES', style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),),

                ],
              ),


              const SizedBox(height: 10,),
              Text(AppString.missionText,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  //fontWeight: FontWeight.w500
                ),),
              const SizedBox(height: 30,),

              const SizedBox(height: 6,),
              Text(AppString.visionText,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  //fontWeight: FontWeight.w500
                ),),

            ],
          ),
        ),
      ),
    );
  }
}


class AppString {
  static String missionText = 'To empower and enhance the well-being of all Australians by providing seamless access to telehealth consultations, online prescriptions with power of home delivery ensuring quality of healthcare is within everyone’s reach.';
  static String visionText = 'We aspire to be the leading healthcare platform in Australia, revolutionizing the way healthcare is delivered. Our commitment is to make healthcare more accessible and convenient, improving the lives of millions. We envision a healthier and happier Australia, where healthcare is a right, not a privilege.';
}