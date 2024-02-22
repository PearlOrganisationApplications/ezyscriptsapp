import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/constant/app_string.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/main.dart';
import 'package:flutter/material.dart';

import '../../../components/textformfield.dart';
import '../../cart/cart_screen.dart';


class MedicalDescription extends StatefulWidget {

final String text;
MedicalDescription({required this.text});
  @override
  State<MedicalDescription> createState() => _MedicalDescriptionState();
}

class _MedicalDescriptionState extends State<MedicalDescription> {
  final controller=TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isAlergies = false;
  bool isTakeMed = false;
  bool isMedicalHistory = false;
  bool isChronoicConditions = false;
  Map<int, String> answers = {};
  List<String> selectedHealthConditions = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        title: Text(widget.text,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w400),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            costCard(),
            formFields(),
            checkAlergies(),
            medicationTaking(),
            medicalHistory(),
            noChronicConditions(),
            chronicList(),
            requestDetails(),
            questionsList(),
            CustomButton(text: 'Add Card', onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
            },width: screenSize.width*.35,)
          ],
        ),
      ),
    );
  }

  Widget costCard(){
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12),
      child: Card(
        child: Container(
          height: screenSize.height*.40,
          child: Column(
            children: [
              Text(costTitle,style: TextStyle(color: AppColors.primary,fontSize: 19),),
              SizedBox(height: 10,),
              Text(costDescription)
            ],
          ),
        ),
      ),
    );
  }
  Widget formFields(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: screenSize.width*.9,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Subscription Start Date *',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              CustomTextFormField(labelText: 'Subscription Start Date',controller: controller,onTap: (){
                _selectDate(context);
              },),
              SizedBox(height: 6,),
              Text('Medicare Card Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              CustomTextFormField(labelText: '',controller: controller,),
              SizedBox(height: 6,),
              Text('Ref Number',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              CustomTextFormField(labelText: '',controller: controller,),
              SizedBox(height: 6,),
              Text('Concession Card (Optional)',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              CustomTextFormField(labelText: '',controller: controller,),
              SizedBox(height: 6,),
              Text('Department of Veteran Affairs(DVA)',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              CustomTextFormField(labelText: '',controller: controller,),
              SizedBox(height: 6,),
              Text('Do you have any allergies',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              Row(
                children: [
                  Checkbox(
                    value: this.isAlergies,
                    onChanged: (bool ?value) {
                      setState(() {
                        this.isAlergies = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10,),//Checkbo
                  Text('No Alergies',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget checkAlergies(){
    return isAlergies?Container():Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Specify your allergies?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'Please list any allergies you have', controller: controller)

        ],
      ),
    );
  }

  Widget medicationTaking(){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What medications are you currently taking?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          Row(
            children: [
              Checkbox(
                value: this.isTakeMed,
                onChanged: (bool ?value) {
                  setState(() {
                    this.isTakeMed = value!;
                  });
                },
              ),
              SizedBox(width: 10,),//Checkbo
              Text('I am not talking any medications',),
            ],
          ),
          isTakeMed?Container():
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Specify your medications ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              CustomTextFormField(labelText: 'Please list any allergies medication you are currently talking', controller: controller)
            ],
          ),


        ],
      ),
    );
  }

  Widget medicalHistory(){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brief madical history',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          Row(
            children: [
              Checkbox(
                value: this.isMedicalHistory,
                onChanged: (bool ?value) {
                  setState(() {
                    this.isMedicalHistory = value!;
                  });
                },
              ),
              SizedBox(width: 10,),//Checkbo
              Text('I dont have a medical history',),
            ],
          ),
          isMedicalHistory?Container():
          Column(
            children: [
              Text('Provide a summary of medical history',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              CustomTextFormField(labelText: '', controller: controller)
            ],
          ),



        ],
      ),
    );
  }

  Widget noChronicConditions(){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('No Chronic Conditions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          Row(
            children: [
              Checkbox(
                value: this.isChronoicConditions,
                onChanged: (bool ?value) {
                  setState(() {
                    this.isChronoicConditions = value!;
                  });
                },
              ),
              SizedBox(width: 10,),//Checkbo
              Text('I dont have any Chronoic Conditions'),
            ],

          ),

        ],
      ),
    );
  }

  Widget chronicList(){
    return isChronoicConditions?Container(): Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chronic Conditions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          Container(
            height: screenSize.height*.5,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: ListView.builder(
                shrinkWrap:true,
                itemCount: healthConditions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: selectedHealthConditions.contains(healthConditions[index]),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              selectedHealthConditions.add(healthConditions[index]);
                            } else {
                              selectedHealthConditions.remove(healthConditions[index]);
                            }
                          });
                        },
                      ),
                      Text(healthConditions[index]),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget requestDetails(){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('REQUEST DETAILS',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
          SizedBox(height: 10,),
          Text(additionalInformation),
          SizedBox(height: 10,),
          Text('What is the reason for your request?*',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700)),
          SizedBox(height: 10,),
          CustomTextFormField(labelText: 'Additional Information to add ', controller: controller),
          Text('DIGITAL MEDICAL CONSULTATION',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
           ],
      ),
    );
  }
  Widget questionsList(){
    return Container(
      height: screenSize.height*.45,
      child: ListView.separated(
        shrinkWrap: true,
          itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(questions[index],style: TextStyle(color: Colors.black),),
            Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            Radio<String>(
            value: 'Yes',
            groupValue: answers[index],
            onChanged: (value) {
            setState(() {
            answers[index] = value!;
            });
            },
            ),
              Text('Yes')
          ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: 'No',
                  groupValue: answers[index],
                  onChanged: (value) {
                    setState(() {
                      answers[index] = value!;
                    });
                  },
                ),
                Text('No')
              ],
            )
          ],
        );
      },
          separatorBuilder:(context, index) =>SizedBox(height: 10),
          itemCount:questions.length),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

}

