

import 'dart:convert';

import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/components/percentindicator.dart';
import 'package:ezyscripts/components/toast.dart';
import 'package:ezyscripts/main.dart';
import 'package:ezyscripts/screens/cart/cart_screen.dart';
import 'package:ezyscripts/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/textformfield.dart';
import '../../../constant/app_string.dart';
import 'package:http/http.dart'as http;

import '../../../constant/colors.dart';
import '../../../controller/totalprice controller.dart';
import '../../../repository/services/api_class.dart';

class Step3 extends StatefulWidget {
  final String productName;
  Step3({required this.productName});
  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  final controller=TextEditingController();
  final mediacreController=TextEditingController();
  final refNumController=TextEditingController();
  final conseCardController=TextEditingController();
  final dvaController=TextEditingController();
  final specifyAlergiesController=TextEditingController();
  final specifyMediationsController=TextEditingController();
  final medicalHistoryController=TextEditingController();
  String? _selectedColor;

  // final PriceController priceController = Get.put(PriceController());

  bool isAlergies = false;
  bool isTakeMed = false;
  bool isMedicalHistory = false;
  bool isChronoicConditions = false;
  List<String> producName=[];
  List<String> selectedHealthConditions = [];
  @override
  Widget build(BuildContext context) {
     producName=widget.productName.split('-');
     print(producName);
     producName==null?Center(child: CircularProgressIndicator(),):Text('nd');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              formFields(),
              checkAlergies(),
              medicationTaking(),
              medicalHistory(),
              noChronicConditions(),
              chronicList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(text: 'Previous', onPressed: (){},width: screenSize.width*0.34,),
                  CustomButton(text: 'Add To Cart', onPressed: (){
                    print(isChronoicConditions);
                    requestScript();
                    // requestScript();
                  },width: screenSize.width*0.34),
                ],
              )
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Step 3 of 3'),
            SizedBox(height: 20,),
            ProgressIndicatorContainer(percent: 1, text: '100%'),
            SizedBox(height: 20,),
            Text('Medicare Card Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
            CustomTextFormField(labelText: '',controller: mediacreController,
              validator: (value){
              if(value!=null){
                return 'Medicare Card Details Is requred';
              }
              },
            ),
            SizedBox(height: 6,),
            Text('Ref Number',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
            CustomTextFormField(labelText: '',controller: refNumController,),
            SizedBox(height: 6,),
            Text('Card color',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedColor,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedColor = newValue;
                });
              },
              items: <String>['Gold', 'White', 'Orange']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select a color'),
            ),

            Text('Concession Card ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),

            CustomTextFormField(labelText: '',controller: conseCardController,),
            SizedBox(height: 6,),

            Text('Department of Veteran Affairs(DVA)',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),


            CustomTextFormField(labelText: '',controller: dvaController,),
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
    );
  }
  Widget checkAlergies(){
    return isAlergies?Container():Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Specify your allergies?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          CustomTextFormField(labelText: 'Please list any allergies you have', controller: specifyAlergiesController)

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
              CustomTextFormField(labelText: 'Please list any allergies medication you are currently talking', controller: specifyMediationsController)
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
              CustomTextFormField(labelText: '', controller: medicalHistoryController)
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
                    print(isChronoicConditions);
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
  Future<void> requestScript() async {
    try {
      final response = await http.post(
        Uri.parse(Api.requestScript),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "product_name": producName[0],
          "product_price": producName[1],
          "medicare_card_no": mediacreController.text,
          "ref_no": refNumController.text,
          "concession_card_no": conseCardController.text,
          "card_color": _selectedColor.toString(),
          "dva_no": dvaController.text,
          "have_allergies": isAlergies.toString(),
          "allergy_desc": isAlergies ? null : specifyAlergiesController.text,
          "have_medications": isTakeMed.toString(),
          "medication_desc": isTakeMed ? null : specifyMediationsController.text,
          "have_medic_history": isMedicalHistory.toString(),
          "medic_desc": isMedicalHistory ? null : medicalHistoryController.text,
          "have_chronic": isChronoicConditions.toString(),
          "chronic_desc": isChronoicConditions ? [] : selectedHealthConditions.toList(),
        }),
      );

      // Handle the response
      if (response.statusCode == 200) {
        var result=jsonDecode(response.body);
        CustomToast.showToast(result['message']);
        getCartDetils();
        await Future.delayed(Duration(seconds: 3));
         // priceController.addPrices();
         Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
        print(response.body);
      } else {
        var result=jsonDecode(response.body);
        CustomToast.showToast(result['message']);
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('Exception during request: $e');
    }
  }
}
