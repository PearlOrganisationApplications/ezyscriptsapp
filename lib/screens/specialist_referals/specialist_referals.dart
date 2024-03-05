import 'package:ezyscripts/constant/app_string.dart';
import 'package:ezyscripts/screens/specialist_referals/specialist_referals_description.dart';
import 'package:flutter/material.dart';

import '../../components/custombutton.dart';
import '../../constant/colors.dart';
import '../../main.dart';
import '../bloodtest/blood_description.dart';




class ReferedSpecialist extends StatelessWidget {
  const ReferedSpecialist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 18),
          child: ListView(
            children: [
              specilaistSkin(),
              eyeSpecialist(),
              colonscopySpecilaist()
            ],
          ),
        ),
      ),

    );
  }
  Widget specilaistSkin(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(skin,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),),
        Divider(color: Colors.black),
        Container(
          height: screenSize.height*.40,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(height: 10,),
            itemCount: skinListTitles.length,
            itemBuilder: (context,index) {
              return Card(
                child: Column(
                  children: [
                    Text(skinListTitles[index],style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w300),),
                    Divider(color: Colors.orange,indent: 20,endIndent: 20,),
                    Text(skinListSubtitles[index]),
                    SizedBox(height: 10,),
                    CustomButton(text: buttonText, onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SpecialistReferalsDescription(text: skinListTitles[index], price: 15,),));
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
  Widget eyeSpecialist(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eyes,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),),
        Divider(color: Colors.black),
        Container(
          height: screenSize.height*.40,

          child: ListView.separated(
            shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 10,),
              itemCount: eyesSubtitlesList.length,
              itemBuilder: (context,index) {
                return Card(
                  child: Column(
                    children: [
                      Text(eyesTitlesList[index],style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w300),),
                      Divider(color: Colors.orange,indent: 20,endIndent: 20,),
                      Text(eyesSubtitlesList[index]),
                      SizedBox(height: 10,),
                      CustomButton(text: buttonText, onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => SpecialistReferalsDescription(text: eyesTitlesList[index], price: 15,),));
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
  Widget colonscopySpecilaist(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(colonosopy,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),),
        Divider(color: Colors.black),
        Container(
          height: screenSize.height*.40,

          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 30,),
              shrinkWrap: true,
              itemCount: colonoscopySubTitleList.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12),
                  child: Card(
                    child: Container(
                      child: Column(
                        children: [
                          Text(colonoscopyTitleList[index],style: TextStyle(color: AppColors.primary,fontSize: 15,fontWeight: FontWeight.w700),),
                          Divider(color: Colors.orange,indent: 30,endIndent: 30,),
                          Text(colonoscopySubTitleList[index]),
                          CustomButton(text: buttonText, onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => SpecialistReferalsDescription(text: colonoscopyTitleList[index], price: 15,),));
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
