

import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/constant/app_string.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/main.dart';
import 'package:flutter/material.dart';

import 'description_screen/description_screen.dart';


class MedicalCertificate extends StatelessWidget {
  const MedicalCertificate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(heading,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w500),),),

      body: SingleChildScrollView(
        child: Column(children: [
              certifiacteList()
        ],),
      ),
    );
  }
  Widget certifiacteList(){
    return Container(
      height: screenSize.height*.86,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 30,),
        shrinkWrap: true,
        itemCount: medicalDescription.length,
        itemBuilder: (context,index) {
          print(medicalDescription.length);
          return Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 12),
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Text(medicalDescriptionTitles[index],style: TextStyle(color: AppColors.primary,fontSize: 15,fontWeight: FontWeight.w700),),
                    Divider(color: Colors.orange,indent: 30,endIndent: 30,),
                    Text(medicalDescription[index]),
                    CustomButton(text: buttonText, onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>
                          MedicalDescription(text: medicalDescriptionTitles[index],),));
                    },width: screenSize.width*.50,)
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
