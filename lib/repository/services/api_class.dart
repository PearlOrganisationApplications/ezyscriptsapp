import 'dart:convert';

import 'package:ezyscripts/components/toast.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/controller/totalprice%20controller.dart';
import 'package:ezyscripts/screens/cart/cart_screen.dart';
import 'package:ezyscripts/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
class Api{
static const baseurl='https://test.pearl-developer.com/eazyscript/public/api';
static const signup='$baseurl/patient/signup';
static const login="$baseurl/patient/login";
static const requestScript="$baseurl/script/requestPrescription";
static const getCartDetails="$baseurl/script/getCartDetails";
static const medicalCertificatePost="$baseurl/script/request-Certificate";
static const requestConsulation="$baseurl/script/requestConsultation";
static const referals="$baseurl/script/request-referral";
static const blood="$baseurl/script/request-bloodTest";
static const removeCart="$baseurl/script/removeFromCart";
}


enum Status{loadig,sucess}


// Define a loading state variable
late bool statusOfCart;
void removeCart(int index, String tableName, BuildContext context) async {
  var quantity = Provider.of<NumberProducts>(context, listen: false);
  try {
    final response = await http.post(
      Uri.parse(Api.removeCart),
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'product_id': index.toString(),
        'table_name': tableName,
      },
    );

    if (response.statusCode == 200) {
      var result=jsonDecode(response.body);
      statusOfCart=result['status'];
      quantity.decrementProduct();
      getCartDetils();
      CustomToast.showToast('Remove Cart product successfully');
      statusOfCart
          ? Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WillPopScope(
            onWillPop: () async {
              // Returning false here prevents the route from being popped
              return false;
            },
            child: HomeScreen(),
          ),
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      );
    } else {
      var result=jsonDecode(response.body);
      statusOfCart=result['status'];
      print('Response body: ${response.body}');
      print('Something went wrong. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

// Widget where you want to display the loader

