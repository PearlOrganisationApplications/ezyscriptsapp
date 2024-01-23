import 'package:ezyscripts/components/textformfield.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/custombutton.dart';
import '../components/genderdropdown.dart';
import '../components/yeardropdown.dart';
import 'package:http/http.dart' as http;

import '../repository/services/api_class.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String selectedUserType = '';
  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _ssn = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _address1 = TextEditingController();
  TextEditingController _address2 = TextEditingController();
  TextEditingController _zipCode = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _password = TextEditingController();
  String? _selectedOption;
  final _formKey = GlobalKey<FormState>();
  final Uri _url = Uri.parse('https://ezyscripts.com.au/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EzyScripts',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(
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
                  value: 'Patient',
                  groupValue: selectedUserType,
                  onChanged: (value) {
                    setState(() {
                      selectedUserType = value as String;
                    });
                  },
                ),
                Text('Patient'),
                Radio(
                  value: 'Doctor',
                  groupValue: selectedUserType,
                  onChanged: (value) {
                    setState(() {
                      selectedUserType = value as String;
                      Future<void> _launchUrl() async {
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      }
                    });
                  },
                ),
                Text('Doctor'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                        validator: (value) => value?.isEmpty ?? true
                            ? "First Name is required"
                            : null,
                        labelText: "Enter First Name",
                        controller: _fName),
                    CustomTextFormField(
                        validator: (value) => value?.isEmpty ?? true
                            ? "Last Name is required"
                            : null,
                        labelText: "Enter Last Name",
                        controller: _lName),
                    CustomTextFormField(
                        validator: (value) =>
                            value?.isEmpty ?? true ? "SSN is required" : null,
                        labelText: "Enter SSN (Optional)",
                        controller: _ssn),
                    Container(
                        width: 340,
                        alignment: Alignment.topLeft,
                        child: Text("Select Gender *")),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      color: Colors.grey,
                      child: DropdownButtonFormField<String>(
                        value: _selectedOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue;
                            print(_selectedOption);

                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'Male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'Feamle',
                            child: Text('Female'),
                          ),
                          DropdownMenuItem(
                            value: 'Others',
                            child: Text('Others'),
                          ),
                        ],
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          labelText: _selectedOption,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                        validator: (value) => value?.isEmpty ?? true
                            ? "Date of birth is required"
                            : null,
                        labelText: "Select data of birth",
                        controller: _dob),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        SizedBox(
                          width: 140,
                          child: CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "age is required"
                                : null,
                            labelText: "Enter age",
                            controller: _age,
                          ),
                        ),
                        SizedBox(width: 140, child: DateOfBirthDropDown())
                      ],
                    ),
                    CustomTextFormField(
                        validator: (value) => value?.isEmpty ?? true
                            ? "contact number is required"
                            : null,
                        labelText: "Enter contact number",
                        controller: _contact),
                    CustomTextFormField(
                        validator: (value) =>
                            value?.isEmpty ?? true ? "email is required" : null,
                        labelText: "Enter email",
                        controller: _email),
                    CustomTextFormField(
                        validator: (value) =>
                            value?.isEmpty ?? true ? "password" : null,
                        labelText: "Enter password",
                        controller: _password),
                    CustomTextFormField(
                        validator: (value) => value?.isEmpty ?? true
                            ? "address 1 is required"
                            : null,
                        labelText: "address 1",
                        controller: _address1),
                    CustomTextFormField(
                        validator: (value) => value?.isEmpty ?? true
                            ? "Date of birth is required"
                            : null,
                        labelText: "address 2",
                        controller: _address2),
                    CustomTextFormField(
                        validator: (value) => value?.isEmpty ?? true
                            ? "address 2 is required"
                            : null,
                        labelText: "Enter zipcode",
                        controller: _zipCode),
                    CustomTextFormField(
                        validator: (value) =>
                            value?.isEmpty ?? true ? "State is required" : null,
                        labelText: "Enter State",
                        controller: _state),
                    CustomTextFormField(
                        validator: (value) =>
                            value?.isEmpty ?? true ? "city is required" : null,
                        labelText: "select city",
                        controller: _city),
                  ],
                ),
              ),
            ),
            CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('yes');
                  }
                },
                text: "Submit"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have Account'),
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('yes');
                      }
                      userSignup();
                    },
                    child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }

  void userSignup() async {
    final response = await http.post(Uri.parse(Api.signup), body: {
      'name': '$_fName$_lName.text',
      'contact': _contact.text,
      'email': _email.text,
      ' gender': _selectedOption,
      'age': _age.text,
      ' dob': _dob.text,
      'state': _state.text,
      ' city': _city.text,
      ' zip_code': 248007,
      'address': '$_address1$_address2',
      'password': _password.text,
    });
    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
