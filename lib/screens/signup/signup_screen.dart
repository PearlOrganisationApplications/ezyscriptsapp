import 'dart:developer';

import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/custombutton.dart';
import '../../components/textformfield.dart';
import '../../components/validator.dart';
import '../../components/yeardropdown.dart';
import '../../constant/colors.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup>  with FormValidationMixin{


  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );
      if (result != null) {
        setState(() {
          filePath = result.files.single.path!;
        });
      } else {
        // User canceled the picker
      }
    } catch (e) {
      // Handle any exceptions that might occur
      print('Error picking document: $e');
    }
  }

  Future<void> _launchUrl() async {
    if (!await canLaunch('https://ezyscripts.com.au/')) {
      throw Exception('Could not launch ');
    } else {
      await launch('https://ezyscripts.com.au/');
    }
  }
  String getFileName(String path) {
    return basename(path);
  }
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
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
                          });
                          _launchUrl();
                        },
                      ),
                      Text('Doctor'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "First Name is required"
                                : null,
                            labelText: "Enter First Name",
                            controller: fName),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "Last Name is required"
                                : null,
                            labelText: "Enter Last Name",
                            controller: lName),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "height is required"
                                : null,
                            labelText: "Enter height ",
                            controller: height),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "Weight is required"
                                : null,
                            labelText: "Enter Weight ",
                            controller: weight),
                        Container(
                          width: 340,
                          alignment: Alignment.topLeft,
                          child: const Text("Select Gender *"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          child: DropdownButtonFormField<String>(
                            value: selectedOption,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption = newValue;
                                log(selectedOption.toString());
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: 'Male',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem(
                                value: 'Female',
                                child: Text('Female'),
                              ),
                              DropdownMenuItem(
                                value: 'Others',
                                child: Text('Others'),
                              ),
                            ],
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12),
                              labelText: selectedOption,
                            ),
                          ),
                        ),
                        CustomTextFormField(
                          onTap: () async {
                            DateTime? datePicker = await showDatePicker(
                              initialDate: DateTime.now(),
                              context: context,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2700),
                            );
                            if (datePicker != null) {
                              setState(() {
                                dob.text = datePicker
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0];
                              });
                            }
                          },
                          validator: (value) => value?.isEmpty ?? true
                              ? "Date of birth is required"
                              : null,
                          labelText: "Select data of birth",
                          controller: dob,
                        ),
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
                                controller: age,
                              ),
                            ),
                            SizedBox(width: 140, child: DateOfBirthDropDown())
                          ],
                        ),
                        CustomTextFormField(
                            validator: validateMobile,
                            labelText: "Enter contact number",
                            controller: contact),
                        CustomTextFormField(
                            validator: validateEmail,
                            labelText: "Enter email",
                            controller: email),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "Medicare number  is required"
                                : null,
                            labelText: "Medicare number",
                            suffix: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_drop_up),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            controller: medicare),
                        ElevatedButton(
                          onPressed: _pickDocument,
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primary,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.attach_file, size: 20),
                              SizedBox(width: 8),
                              Text('Add Documents'),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: filePath.isNotEmpty
                              ? Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.file_present,
                                            size: 20),
                                        SizedBox(width: 8),
                                        Text('Selected File:'),
                                        SizedBox(width: 8),
                                        Expanded(
                                            child:
                                                Text(getFileName(filePath))),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),
                        CustomTextFormField(
                            validator: validatePassword,
                            labelText: "Enter password",
                            controller: password),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "address 1 is required"
                                : null,
                            labelText: "address 1",
                            controller: address1),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "Date of birth is required"
                                : null,
                            labelText: "address 2",
                            controller: address2),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "address 2 is required"
                                : null,
                            labelText: "Enter zipcode",
                            controller: zipCode),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "State is required"
                                : null,
                            labelText: "Enter State",
                            controller: state),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "city is required"
                                : null,
                            labelText: "select city",
                            controller: city),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {
                  if (formey.currentState!.validate()) {}
                  userSignup(context);
                },
                text: "Submit",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have Account'),
                  TextButton(
                      onPressed: () {
                        const LoginScreen();
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
