import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppColors {
  static const primary = Color(0xFF1F2260);
  static const secondary = Color(0xFF484BB6);
  static const text = Color(0xFF2F2F2F);
  static const accent = Color(0xFFFFCD68);
}
class Token {
  static Future<void> clearToken() async {
    // Your logic to clear or remove the token, for example:
    // SharedPreferences, secure storage, or any other method you're using

    // In this example, using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

}
Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  print(token);
  return token ?? ''; // return token or an empty string if token is null
}
String ?token;



