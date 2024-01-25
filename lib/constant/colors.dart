import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppColors {
  static const primary = Color(0xFF1F2260);
  static const secondary = Color(0xFF484BB6);
  static const text = Color(0xFF2F2F2F);
  static const accent = Color(0xFFFFCD68);
}
class Token {
  final String token='';
  static Future<String> loadToken() async{
    SharedPreferences prefs;
    String token;

    // Assuming this code is inside an async function
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';

    return token;
  }
}





