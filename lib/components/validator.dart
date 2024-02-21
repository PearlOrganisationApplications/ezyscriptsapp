import 'dart:convert';
import 'dart:developer';

import 'package:ezyscripts/components/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/colors.dart';
import '../repository/services/api_class.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';

mixin FormValidationMixin {
  String selectedUserType = '';
  String filePath = '';
  String? selectedOption;
  bool passwordShow=false;
  bool rememberMe = false;
  bool isDoctorSelected = false;
  bool isPatientSelected = false;
  final formey=GlobalKey<FormState>();
  int ?age1;

 final TextEditingController fName = TextEditingController();
 final TextEditingController lName = TextEditingController();
 final TextEditingController height = TextEditingController();
 final TextEditingController gender = TextEditingController();
 final TextEditingController email = TextEditingController();
 final TextEditingController email1 = TextEditingController();
 final TextEditingController dob = TextEditingController();
  final TextEditingController address1 = TextEditingController();
  final TextEditingController address2 = TextEditingController();
  final TextEditingController zipCode = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController medicare = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password1 = TextEditingController();
  final passwordRegEx = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  final upperCaseRegEx = RegExp(r'[A-Z]');
  final lowerCaseRegEx = RegExp(r'[a-z]');
  final numberRegEx = RegExp(r'[0-9]');
  final emailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  final mobileRegEx = RegExp(r'^[0-9]{10}$');

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (!mobileRegEx.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!emailRegEx.hasMatch(value)) {
      return 'Please enter valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!value.contains(upperCaseRegEx)) {
      return 'Password must contain at least 1 uppercase letter';
    }
    if (!value.contains(lowerCaseRegEx)) {
      return 'Password must contain at least 1 lowercase letter';
    }
    if (!value.contains(numberRegEx)) {
      return 'Password must contain at least 1 number';
    }
    if (!passwordRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter, 1 lowercase letter and 1 number';
    }
    return null;
  }

// signup function for signup
  void userSignup(BuildContext context) async {
    final currentContext = context;
    try {
      // Ensure _filePath is not empty before making the request
      if (filePath.isEmpty) {
        CustomToast.showToast('Please pick a document before signing up.');
        log('Please pick a document before signing up.');
        return;
      }
      // Create a MultipartRequest
      var request = http.MultipartRequest('POST', Uri.parse(Api.signup));
      // Add form fields
      request.fields['name'] = '${fName.text} ${lName.text}';
      request.fields['contact'] = contact.text;
      request.fields['email'] = email.text;
      request.fields['gender'] = selectedOption.toString();
      request.fields['age'] = age1.toString();
      request.fields['dob'] = dob.text;
      request.fields['state'] = state.text;
      request.fields['city'] = city.text;
      request.fields['zip_code'] = zipCode.text;
      request.fields['address'] = '${address1.text}${address2.text}';
      request.fields['password'] = password.text;
      request.fields['height'] = height.text;
      request.fields['weight'] = weight.text;

      var file = await http.MultipartFile.fromPath('document', filePath);
      request.files.add(file);

      // Send the request
      var response = await request.send();
      // Check the response
      if (response.statusCode == 200) {
        log('Signup successful');
        final responseString = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseString);
        CustomToast.showToast(jsonResponse['message']);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
        if (jsonResponse.containsKey('token')) {
          var token = jsonResponse['token'];
          log('Token: $token');
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setString('token', token);
        }
      } else {
        final responseString = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseString);
        CustomToast.showToast(jsonResponse['message']);
        log('${jsonDecode(responseString)}');
        // You can handle the responseString as needed for debugging or logging.
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
      log('Error during signup: $e');
    }
  }

  //login function
  void userLogin(BuildContext context) async {
    try {
      // String token = await Token.loadToken();
      final response = await http.post(
        Uri.parse(Api.login),
        // headers: {'Authorization': 'Bearer $token'},
        body: {
          'email': email1.text,
          'password': password1.text,
        },
      );
      if (response.statusCode == 200) {
        log('Successful Login');
        var result = jsonDecode(response.body);
        var token=result['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        CustomToast.showToast( result['message']);
        await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              // Returning false here prevents the route from being popped
              return false;
            },
            child: HomeScreen(),
          );
        }));
      } else {
        CustomToast.showToast(jsonDecode(response.body)['message']);
        log('Error: ${response.body}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg:e.toString(),
          backgroundColor: Colors.red,
          fontSize: 10,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1
      );
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

      log('Error during login: $e');
    }
  }
}