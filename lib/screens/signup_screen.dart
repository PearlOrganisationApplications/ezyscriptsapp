import 'package:ezyscripts/components/textformfield.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';

import '../components/custombutton.dart';
import '../components/genderdropdown.dart';
import '../components/yeardropdown.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String selectedUserType = '';
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EzyScripts',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  value: 'Doctor',
                  groupValue: selectedUserType,
                  onChanged: (value) {
                    setState(() {
                      selectedUserType = value as String;
                    });
                  },
                ),
                Text('Doctor'),
                Radio(
                  value: 'Doctor',
                  groupValue: selectedUserType,
                  onChanged: (value) {
                    setState(() {
                      selectedUserType = value as String;
                    });
                  },
                ),
                Text('Patient'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Column(
                children: [
                  CustomTextFormField(
                      labelText: "Enter First Name", controller: _email),
                  CustomTextFormField(
                      labelText: "Enter Last Name", controller: _email),
                  CustomTextFormField(
                      labelText: "Enter SSN (Optional)", controller: _email),
                  Container(
                    width: 340,
                      alignment: Alignment.topLeft,
                      child: Text("Select Gender *")),
                  SizedBox(height: 10,),
                  GenderDropDown(),
                  CustomTextFormField(
                      labelText: "Select data of birth", controller: _email),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(
                      width: 140,
                      child: CustomTextFormField(
                        labelText: "Enter age",
                        controller: _email,
                      ),
                    ),
                    SizedBox(
                      width: 140,
                        child: DateOfBirthDropDown())
                  ],
                ),


                  CustomTextFormField(
                      labelText: "Enter contact number", controller: _email),
                  CustomTextFormField(
                      labelText: "Enter email", controller: _email),
                  CustomTextFormField(
                      labelText: "address 1", controller: _email),
                  CustomTextFormField(
                      labelText: "address 2", controller: _email),
                  CustomTextFormField(
                      labelText: "Enter zipcode", controller: _email),
                  CustomTextFormField(
                      labelText: "Enter State", controller: _email),
                  CustomTextFormField(
                      labelText: "select city", controller: _email),
                ],
              ),
            ),
            CustomButton(onPressed: () {}, text: "Submit"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have Account'),
                TextButton(onPressed: () {}, child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
