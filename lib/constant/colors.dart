import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';
import 'package:http/http.dart'as http;

import '../repository/services/api_class.dart';
var totalnumberOfProducts=0;
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
    await prefs.clear();
  }

}
Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  print(token);
  return token ?? ''; // return token or an empty string if token is null
}
String ?token;

MyResponse ? myResponse;
Future<void>getCartDetils()async{
  final response=await http.get(Uri.parse(Api.getCartDetails),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );
  if(response.statusCode==200){
    var result=jsonDecode(response.body);
    navigateToCart=result['status'];
    // print('HOLDDATA${navigateToCart}');
    myResponse=MyResponse.fromJson(result);
  }
  else{
    var result=jsonDecode(response.body);
    navigateToCart=result['status'];
    print('HOLDDATA${navigateToCart}');
    print('CARTDATA${response.body}');
  }
}

late bool navigateToCart;