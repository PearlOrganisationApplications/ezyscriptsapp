import 'dart:convert';
import 'dart:developer';

import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/custombutton.dart';
import '../../components/textformfield.dart';
import '../../components/yeardropdown.dart';
import '../../repository/services/api_class.dart';
import '../../constant/colors.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String selectedUserType = '';
  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dob = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _medicare = TextEditingController();
  String? _selectedOption;
  final _formKey = GlobalKey<FormState>();
  String _filePath = '';

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );
      if (result != null) {
        setState(() {
          _filePath = result.files.single.path!;
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
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            validator: (value) => value?.isEmpty ?? true
                                ? "height is required"
                                : null,
                            labelText: "Enter height ",
                            controller: _height),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "Weight is required"
                                : null,
                            labelText: "Enter Weight ",
                            controller: _weight),
                        Container(
                          width: 340,
                          alignment: Alignment.topLeft,
                          child: const Text("Select Gender *"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
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
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12),
                              labelText: _selectedOption,
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
                                _dob.text = datePicker
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
                          controller: _dob,
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
                            validator: (value) => value?.isEmpty ?? true
                                ? "email is required"
                                : null,
                            labelText: "Enter email",
                            controller: _email),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "email is required"
                                : null,
                            labelText: "Medicare number",
                            suffix: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_up),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down_sharp),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            controller: _medicare),
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
                          child: _filePath.isNotEmpty
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
                                                Text(getFileName(_filePath))),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),
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
                            validator: (value) => value?.isEmpty ?? true
                                ? "State is required"
                                : null,
                            labelText: "Enter State",
                            controller: _state),
                        CustomTextFormField(
                            validator: (value) => value?.isEmpty ?? true
                                ? "city is required"
                                : null,
                            labelText: "select city",
                            controller: _city),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
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
                        if (_formKey.currentState!.validate()) {
                          log('yes');
                        }
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

  void userSignup(BuildContext context) async {
    final currentContext = context;
    try {
      // Ensure _filePath is not empty before making the request
      if (_filePath.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please pick a document before signing up.',)));
        log('Please pick a document before signing up.');
        return;
      }
      // Create a MultipartRequest
      var request = http.MultipartRequest('POST', Uri.parse(Api.signup));
      // Add form fields
      request.fields['name'] = '${_fName.text} ${_lName.text}';
      request.fields['contact'] = _contact.text;
      request.fields['email'] = _email.text;
      request.fields['gender'] = _selectedOption.toString();
      request.fields['age'] = _age.text;
      request.fields['dob'] = _dob.text;
      request.fields['state'] = _state.text;
      request.fields['city'] = _city.text;
      request.fields['zip_code'] = _zipCode.text;
      request.fields['address'] = '${_address1.text}${_address2.text}';
      request.fields['password'] = _password.text;
      request.fields['height'] = _height.text;
      request.fields['weight'] = _weight.text;

      var file = await http.MultipartFile.fromPath('document', _filePath);
      request.files.add(file);

      // Send the request
      var response = await request.send();
      // Check the response
      if (response.statusCode == 200) {
        log('Signup successful');
        final responseString = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseString);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonResponse['message'])));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
        if (jsonResponse.containsKey('token')) {
          var token = jsonResponse['token'];
          log('Token: $token');
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', token);
          log(prefs.getString('token').toString());
        }
      } else {
        final responseString = await response.stream.bytesToString();
        log('${response.statusCode}');

        // You can handle the responseString as needed for debugging or logging.
      }
    } catch (e) {
      print('Error during signup: $e');
    }
  }
}
