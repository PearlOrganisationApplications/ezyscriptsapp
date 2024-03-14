import 'package:ezyscripts/constant/app_string.dart';
import 'package:flutter/material.dart';

import '../../components/custombutton.dart';
import '../../constant/colors.dart';
import '../../main.dart';
import '../medical_certificate/description_screen/description_screen.dart';
import 'blood_description.dart';




class BloodTestScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLOOD TEST'),),
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: Column(
              children: [
                popularBloodTest(),
                otherGeneralTest(),
                woMenTest(),
                menTests()
              ],
            ),
          ),
        ],
      )
    );
  }
  Widget popularBloodTest(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(popular,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),),
        Divider(color: Colors.black),
        Container(
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 10,),
              itemCount: bloodTestTitles.length,
              itemBuilder: (context,index) {
                return Card(
                  child: Column(
                    children: [
                      Text(bloodTestTitles[index],style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w300),),
                      Divider(color: Colors.orange,indent: 20,endIndent: 20,),
                      Text(bloodTestSubtitle[index]),
                      SizedBox(height: 10,),
                      CustomButton(text: buttonText, onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => BloodTestDescription(text: bloodTestTitles[index], price: 15,),));
                      }
                      ,width: screenSize.width*.50,)


                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
  Widget otherGeneralTest(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(otherGeneral,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),),
        Divider(color: Colors.black),
        Container(

          child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 10,),
              itemCount: otherGeneralTestTitles.length,
              itemBuilder: (context,index) {
                return Card(
                  child: Column(
                    children: [
                      Text(otherGeneralTestTitles[index],style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w300),),
                      Divider(color: Colors.orange,indent: 20,endIndent: 20,),
                      Text(otherGeneralTestSub[index]),
                      SizedBox(height: 10,),
                      CustomButton(text: buttonText, onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => BloodTestDescription(text: otherGeneralTestTitles[index], price: 15,),));
                      },width: screenSize.width*.50,)


                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
  Widget woMenTest(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(womenTest,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),),
        Divider(color: Colors.black),
        Container(

          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 30,),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: womenTitles.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12),
                  child: Card(
                    child: Container(
                      child: Column(
                        children: [
                          Text(womenTitles[index],style: TextStyle(color: AppColors.primary,fontSize: 15,fontWeight: FontWeight.w700),),
                          Divider(color: Colors.orange,indent: 30,endIndent: 30,),
                          Text(womenSubtitles[index]),
                          CustomButton(text: buttonText, onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => MedicalDescription(text: womenTitles[index], price: 15,),));
                          },width: screenSize.width*.50,)
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
  Widget menTests(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(menTest,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),),
        Divider(color: Colors.black),
        Container(

          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 30,),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: menSubtitles.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12),
                  child: Card(
                    child: Container(
                      child: Column(
                        children: [
                          Text(menTitles[index],style: TextStyle(color: AppColors.primary,fontSize: 15,fontWeight: FontWeight.w700),),
                          Divider(color: Colors.orange,indent: 30,endIndent: 30,),
                          Text(menSubtitles[index]),
                          CustomButton(text: buttonText, onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => MedicalDescription(text: menTitles[index], price: 15,),));
                          },width: screenSize.width*.50,)
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }


}
