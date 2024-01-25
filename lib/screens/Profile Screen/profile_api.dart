import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'https://test.pearl-developer.com/eazyscript/public/api';
  static const String staticToken = "3|IMW1IylGRQNACz51FP8RXGloBrpm3NRPEvXwdFu8ac039a3e";

  static Future<UserDetails> getProfileDetails() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/patient/get-user'),
        headers: {
          'Authorization': 'Bearer $staticToken',
          'Content-Type': 'application/json',
        },

      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final userDetails = data['user_details'];
        return UserDetails(
          id: userDetails['id'],
          profilePic: userDetails['profile_pic'],
          name : userDetails['name'],
          dob: userDetails['dob'],
          gender: userDetails['gender'],
          contactNumber: userDetails['contact'],
          email: userDetails['email'],
          address: userDetails['address'],
          about: userDetails['about'],
        );
      }  else {
        print('API Error - Status Code: ${response.statusCode}, Body: ${response.body}');
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
  final String? gender;
  final String profilePic;
  final String contactNumber;
  final String email;
  final String address;
  final String about;

  UserDetails({
    required this.name,
    required this.id,
    required this.dob,
     required this.gender,
    required this.profilePic,
    required this.contactNumber,
    required this.email,
    required this.address,
    required this.about,
  });
}