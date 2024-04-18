import 'dart:convert';

import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/constant/app_string.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../components/textformfield.dart';
import '../../../components/toast.dart';

import '../../../repository/services/api_class.dart';


import 'package:http/http.dart' as http;

import '../../controller/totalprice controller.dart';
import '../cart/cart_screen.dart';
import '../home/home_screen.dart';

class SpecialistReferalsDescription extends StatefulWidget {
  late final String text;
  final int price;

  SpecialistReferalsDescription({required this.text, required this.price});

  @override
  State<SpecialistReferalsDescription> createState() => _SpecialistReferalsDescriptionState();
}

class _SpecialistReferalsDescriptionState extends State<SpecialistReferalsDescription> {
  final dobController = TextEditingController();
  final controller1 = TextEditingController();
  final mediacreController = TextEditingController();
  final refNumController = TextEditingController();
  final conseCardController = TextEditingController();
  final dvaController = TextEditingController();
  final specifyAlergiesController = TextEditingController();
  final specifyMediationsController = TextEditingController();
  final medicalHistoryController = TextEditingController();
  final mobileController=TextEditingController();
  final reasonRequestController=TextEditingController();
  final heightController=TextEditingController();
  final weightController=TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isAlergies = false;
  bool isTakeMed = false;
  bool isMedicalHistory = false;
  bool isChronoicConditions = false;
  Map<int, String> answers = {};
  List<String> selectedHealthConditions = [];
  List<String> pathologyHealthConditions = [];
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
        title: Text(
          widget.text,
          style:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.w400),
        ),
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
          widget.text=='Dermatology Referral For Acne'? questionsList():Container(),
          widget.text=='Gastroenterology (Colonoscopy) Referral For 3?5-Year Follow-Up'? referralFor3Year():Container(),

          widget.text=='Dermatology Referral For General Skin/Mole Check'? referalsForGeneralSkin():Container(),
          widget.text=='Ophthalmologist Referral For Age-Related Macular Degeneration'? referlasForgaeRelated():Container(),
          widget.text=='Ophthalmologist Referral For Age-Related Macular Degeneration'&&
              widget.text=='Ophthalmologist Referral For Cataracts'&& widget.text=='Ophthalmologist Referral For Diabetes'&&
              widget.text=='Ophthalmologist Referral For Glaucoma'
              ? referlasForgaeRelated():Container(),
            widget.text=='Gastroenterology (Colonoscopy) Referral For Initial Screen'? referalsForInitialScreenQuestions():Container(),

            CustomButton(
              text: 'Add To Card',
              onPressed: () {
               specilistReferals();
              },
              width: screenSize.width * .35,
            )
          ],
        ),
      ),
    );
  }
  Widget costCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Card(
        child: Container(
          height: screenSize.height * .40,
          child: Column(
            children: [
              Text(
                '${costTitle}${widget.price}',
                style: TextStyle(color: AppColors.primary, fontSize: 19),
              ),
              SizedBox(
                height: 10,
              ),
              Text(costDescription)
            ],
          ),
        ),
      ),
    );
  }

  Widget formFields() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: screenSize.width * .9,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subscription Start Date *',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                labelText: 'Subscription Start Date *',
                controller: dobController,
                onTap: () {
                  _selectDate(context);
                },
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Medicare Card Details',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                labelText: '',
                controller: mediacreController,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Ref Number',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                labelText: '',
                controller: refNumController,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Card color(Optional)',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
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
              Text(
                'Concession Card (Optional)',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                labelText: '',
                controller: conseCardController,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Department of Veteran Affairs(DVA)',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                labelText: '',
                controller: dvaController,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Do you have any allergies',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Checkbox(
                    value: this.isAlergies,
                    onChanged: (bool? value) {
                      setState(() {
                        this.isAlergies = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ), //Checkbo
                  Text(
                    'No Alergies',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget checkAlergies() {
    return isAlergies
        ? Container()
        : Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Specify your allergies?',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
          CustomTextFormField(
              labelText: 'Please list any allergies you have',
              controller: specifyAlergiesController)
        ],
      ),
    );
  }

  Widget medicationTaking() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What medications are you currently taking?',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Checkbox(
                value: this.isTakeMed,
                onChanged: (bool? value) {
                  setState(() {
                    this.isTakeMed = value!;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ), //Checkbo
              Text(
                'I am not talking any medications',
              ),
            ],
          ),
          isTakeMed
              ? Container()
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Specify your medications ',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                  labelText:
                  'Please list any allergies medication you are currently talking',
                  controller: specifyAlergiesController)
            ],
          ),
        ],
      ),
    );
  }

  Widget medicalHistory() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Brief madical history',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Checkbox(
                value: this.isMedicalHistory,
                onChanged: (bool? value) {
                  setState(() {
                    this.isMedicalHistory = value!;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ), //Checkbo
              Text(
                'I dont have a medical history',
              ),
            ],
          ),
          isMedicalHistory
              ? Container()
              : Column(
            children: [
              Text(
                'Provide a summary of medical history',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                  labelText: '', controller: medicalHistoryController)
            ],
          ),
        ],
      ),
    );
  }

  Widget noChronicConditions() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'No Chronic Conditions',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Checkbox(
                value: this.isChronoicConditions,
                onChanged: (bool? value) {
                  setState(() {
                    this.isChronoicConditions = value!;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ), //Checkbo
              Text('I dont have any Chronoic Conditions'),
            ],
          ),
        ],
      ),
    );
  }

  Widget chronicList() {
    return isChronoicConditions
        ? Container()
        : Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chronic Conditions',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Container(
            height: screenSize.height * .5,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: healthConditions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: selectedHealthConditions
                            .contains(healthConditions[index]),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              selectedHealthConditions
                                  .add(healthConditions[index]);
                            } else {
                              selectedHealthConditions
                                  .remove(healthConditions[index]);
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



  Widget pathologyTest() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'PATHOLOGY TESTS INCLUDED',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Container(
            height: screenSize.height * .5,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: pathologyConditions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: pathologyHealthConditions
                            .contains(pathologyConditions[index]),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              pathologyHealthConditions
                                  .add(pathologyConditions[index]);
                            } else {
                              pathologyHealthConditions
                                  .remove(pathologyConditions[index]);
                            }
                          });
                        },
                      ),
                      Expanded(child: Text(pathologyConditions[index])),
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

  Widget questionsList() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('REQUEST DETAILS',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text('If you have a particular doctor you would like the referral addressed to, please enter their name below (optional)',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
          CustomTextFormField(labelText: 'Doctor', controller: mobileController),
          SizedBox(height: 10,),
          Text('DIGITAL MEDICAL CONSULTATION',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
          SizedBox(height: 13,),
          Container(
            height: screenSize.height * .45,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        specialistRefrelesQuestions[index],
                        style: TextStyle(color: Colors.black),
                      ),
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
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: specialistRefrelesQuestions.length),
          ),
        ],
      ),
    );
  }
  Widget referalsForGeneralSkin() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('REQUEST DETAILS',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text('If you have a particular doctor you would like the referral addressed to, please enter their name below (optional)',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
          CustomTextFormField(labelText: 'Doctor', controller: mobileController),
          SizedBox(height: 10,),
          Text('DIGITAL MEDICAL CONSULTATION',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
          SizedBox(height: 13,),
          Container(
            height: screenSize.height * .45,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        referalsForgeneralSkinQuestions[index],
                        style: TextStyle(color: Colors.black),
                      ),
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
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: referalsForgeneralSkinQuestions.length),
          ),
        ],
      ),
    );
  }
  Widget referlasForgaeRelated() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('REQUEST DETAILS',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text('If you have a particular doctor you would like the referral addressed to, please enter their name below (optional)',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
          CustomTextFormField(labelText: 'Doctor', controller: mobileController),
          SizedBox(height: 10,),
          Text('DIGITAL MEDICAL CONSULTATION',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
          SizedBox(height: 13,),
          Container(
            height: screenSize.height * .45,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        referlasForAgeRelatedQuestions[index],
                        style: TextStyle(color: Colors.black),
                      ),
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
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: referlasForAgeRelatedQuestions.length),
          ),
        ],
      ),
    );
  }
  Widget referalsForInitialScreenQuestions() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('REQUEST DETAILS',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text('If you have a particular doctor you would like the referral addressed to, please enter their name below (optional)',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
          CustomTextFormField(labelText: 'Doctor', controller: mobileController),
          SizedBox(height: 10,),
          Text('DIGITAL MEDICAL CONSULTATION',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
          SizedBox(height: 13,),
          Container(
            height: screenSize.height * .45,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        initialScreenQuestions[index],
                        style: TextStyle(color: Colors.black),
                      ),
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
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: initialScreenQuestions.length),
          ),
        ],
      ),
    );
  }
  Widget referralFor3Year() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('REQUEST DETAILS',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text('If you have a particular doctor you would like the referral addressed to, please enter their name below (optional)',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
          CustomTextFormField(labelText: 'Doctor', controller: mobileController),
          SizedBox(height: 10,),
          Text('DIGITAL MEDICAL CONSULTATION',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
          SizedBox(height: 13,),
          Container(
            height: screenSize.height * .45,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        referalsfor3Year[index],
                        style: TextStyle(color: Colors.black),
                      ),
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
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: referalsfor3Year.length),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        // Format the selected date
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        dobController.text =
            formattedDate; // Set the formatted date to the controller
      });
  }

  Future<void> specilistReferals() async {
    var quantity = Provider.of<NumberProducts>(context, listen: false);
    print(widget.text != "Multiple-Day Certificate"
        ? widget.text.split(' ').last
        : "Multiple-Day");
    try {
      // Convert the text from dobController to a DateTime object
      DateTime? dob = DateFormat('yyyy-MM-dd').parse(dobController.text);
      final response = await http.post(
        Uri.parse(Api.referals),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "price": widget.price,
          "sub_st_date": selectedDate.toString(), // Format DateTime as a string
          "medicare_card_no": mediacreController.text,
          "ref_no": refNumController.text,
          "concession_card_no": conseCardController.text,
          "card_color": _selectedColor.toString(),
          "dva_no": dvaController.text,
          "have_allergies": isAlergies.toString(),
          "allergy_desc": isAlergies ? null : specifyAlergiesController.text,
          "have_medications": isTakeMed.toString(),
          "medication_desc":
          isTakeMed ? null : specifyMediationsController.text,
          "have_medic_history": isMedicalHistory.toString(),
          "medic_desc": isMedicalHistory ? null : medicalHistoryController.text,
          "have_chronic": isChronoicConditions.toString(),
          "chronic_desc":
          isChronoicConditions ? [] : selectedHealthConditions.toList(),
          "title": widget.text != "Multiple-Day Certificate"
              ? widget.text.split(' ').last
              : "Multiple-Day",
          "dmc": answers.values.toList(),
          'request_reason': controller1.text
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        print(result);
        quantity.increment();
        getCartDetils();
        CustomToast.showToast(result['message']);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ));
      } else {
        final result = jsonDecode(response.body);
        print(result);
        CustomToast.showToast(result['message']);
      }
    } catch (e) {
      print('Error: $e');
      CustomToast.showToast(e.toString());
      // Handle error
    }
  }
}
