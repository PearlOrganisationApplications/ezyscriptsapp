import 'dart:convert';

import 'package:ezyscripts/components/toast.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl =
      'https://test.pearl-developer.com/eazyscript/public/api';
  static const String staticToken =
      "3|IMW1IylGRQNACz51FP8RXGloBrpm3NRPEvXwdFu8ac039a3e";

  static Future<UserDetails> getProfileDetails(BuildContext context) async {
    await getToken();

    if (token == null) {
      // Show dialog to prompt user to log in
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Required'),
            content: Text('Please log in to view your profile.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      // Throw an exception to indicate that profile details cannot be fetched without a token
      throw Exception('Token is null');
    }

    try {
      final response = await http.get(
        Uri.parse('$apiUrl/patient/get-user'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final userDetails = data['user_details'];
        return UserDetails(
          id: userDetails['id'] ?? '',
          profilePic: userDetails['profile_pic'] ?? '',
          name: userDetails['name'] ?? '',
          dob: userDetails['dob'] ?? '',
          gender: userDetails['gender'] ?? '',
          contactNumber: userDetails['contact'] ?? '',
          email: userDetails['email'] ?? '',
          address: userDetails['address'] ?? '',
          about: userDetails['about'] ?? '',
        );
      } else {
        CustomToast.showToast('Your Session is Expired Login again');
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        print(
            'API Error - Status Code: ${response.statusCode}, Body: ${response.body}');
        throw Exception('Failed to load profile details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class UserDetails {
  final int id;
  final String name;
  final String dob;
  final String? gender; // Make gender nullable
  final String profilePic;
  final String contactNumber;
  final String email;
  final String address;
  final String about;

  UserDetails({
    required this.id,
    required this.name,
    required this.dob,
    required this.profilePic,
    required this.contactNumber,
    required this.email,
    required this.address,
    required this.about,
    this.gender, // Make gender nullable
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'], // No need for null check here, it's already nullable
      profilePic: json['profile_pic'] ?? '',
      contactNumber: json['contact_number'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      about: json['about'] ?? '',
    );
  }
}

