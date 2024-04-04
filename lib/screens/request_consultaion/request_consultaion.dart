import 'package:ezyscripts/constant/app_string.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../components/custombutton.dart';
import '../../main.dart';
import '_description.dart';




class RequestConsultaion extends StatelessWidget {
  const RequestConsultaion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TELEHEALTH CONSULTATIONS',style: TextStyle(color: AppColors.primary,fontSize: 20,fontWeight: FontWeight.w700),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
        child: ListView(
          children: [
            Column(
              children: [
                generalConsultion(),
                otherConsultaion(),
                consultaionList()
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget generalConsultion(){
    return Container(
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 30,),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: generalConsulation.length,
          itemBuilder: (context,index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(general,style: TextStyle(color: AppColors.primary,fontSize: 15,fontWeight: FontWeight.w700),),
                  Divider(color: Colors.black),
                  Card(
                    child: Column(
                      children: [
                        Text(generalCons,style: TextStyle(color: AppColors.primary,fontSize: 15,fontWeight: FontWeight.w700),),
                        Divider(color: Colors.orange,indent: 20,endIndent: 20,),
                        Text(generalDes),
                        SizedBox(height: 10,),
                        CustomButton(text: referal, onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>RequestConsulationDescription(text:generalConsulation[index], price: 40,)));
                        },width: screenSize.width*.50,)


                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
  Widget otherConsultaion(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(otherCons,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600),),
          Divider(color: Colors.black),
        ],
      ),
    );
  }
  Widget consultaionList(){
    return Container(
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 30,),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: otherConsulationDesc.length,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12),
              child: Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(otherConsulationTitles[index],style: TextStyle(color: AppColors.primary,fontSize: 15,fontWeight: FontWeight.w700),),
                        Divider(color: Colors.orange,indent: 30,endIndent: 30,),
                        Text(otherConsulationDesc[index]),
                        CustomButton(text: buttonText, onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>RequestConsulationDescription(text:otherConsulationTitles[index], price: 40,)));
                              // MedicalDescription(text: otherConsulationTitles[index], price: 40,),));
                        },width: screenSize.width*.50,)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

}
