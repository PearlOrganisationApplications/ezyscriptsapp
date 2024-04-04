import 'dart:convert';

import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/components/textformfield.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controller/totalprice controller.dart';
import '../../main.dart';
import '../cart/cart_screen.dart';
import 'dart:math';

import '../verify_details/verify_details_screen.dart';
var lengthProduct = 0;
late String payment_id;

class OrderDetails extends StatefulWidget {
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final coupon = TextEditingController();
  final cvc = TextEditingController();
  final expiryDate = TextEditingController();
  final cardCode = TextEditingController();
  final cardHolder = TextEditingController();

  bool showCupon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 58.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                orederDetails(),
                SizedBox(
                  height: 20,
                ),
                // paymentMode(),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Pay Now',
                  onPressed: () {
                     makePayment();
                  },
                  width: screenSize.width * .55,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget orederDetails() {
    final request = Provider.of<RequestController>(context);
    return Container(
      alignment: Alignment.center,
      width: screenSize.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        // Adjust the border radius as needed
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Product',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            ListView.builder(
              itemCount: 1, // Use the actual length of the list
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // Return a widget from itemBuilder
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(myResponse!.scriptDetails[index].productName),
                        Text(
                            'Medical Card No:${myResponse!.scriptDetails[index].medicareCardNo.toString()} '
                            'Chronics: ${myResponse!.scriptDetails[index].chronicDesc} '
                            'CardColor: ${myResponse!.scriptDetails[index].cardColor} '
                            'Mediations: ${myResponse!.scriptDetails[index].haveMedications} '
                            'Chronic: ${myResponse!.scriptDetails[index].haveChronic} '),
                      ],
                    ),
                  ),
                );
              },
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    showCupon = !showCupon;
                  });
                },
                child: Text(
                  'Have A Coupon? Click Here To Enter Your Code',
                )),
            showCupon
                ? Text(
                    'Coupon Code',
                    style: TextStyle(color: Colors.black),
                  )
                : Container(),
            showCupon
                ? Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    child:
                        CustomTextFormField(labelText: '', controller: coupon),
                  )
                : Container(),
            showCupon
                ? CustomButton(
                    text: 'Apply',
                    onPressed: () {},
                    width: screenSize.width * .34,
                  )
                : Container(),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'OrderTotal',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$${totalPrice}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentMode() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // Adjust the border radius as needed
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'PAYMENT INFORMATION',
              style: TextStyle(
                  color: AppColors.primary, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Credit Card',
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/visa.png'),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text(
                      '(Your Card Details Will Be Securely Saved And Processed By One Of Our Sales Staff)'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Card Holder *'),
                  CustomTextFormField(
                      labelText: 'Card Holder', controller: cardHolder),
                  Text('Card Number *'),
                  CustomTextFormField(
                      labelText: 'Card Number', controller: cardCode),
                  Text('Expiry(YY-MM) *'),
                  CustomTextFormField(
                      labelText: 'Expiry(YY-MM)', controller: expiryDate),
                  Text(
                    'CVC *',
                    style: TextStyle(color: Colors.black),
                  ),
                  CustomTextFormField(labelText: 'CVC', controller: cvc),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent(totalPrice, 'usd');
      var gpay = PaymentSheetGooglePay(
          merchantCountryCode: "GB", currencyCode: "GBP", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  billingDetails: BillingDetails(name: 'Ashutosh'),
                  //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Abhi',
                  googlePay: gpay))
          .then((value) {
        print(BillingDetails());
      });
      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        createPaymentIntent(totalPrice, 'usd');
        await Future.delayed(Duration(seconds: 2));
        confirmPaymentIntent(payment_id);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Payment Successful"),
              content: Text("Thank you for your payment!"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(double amount, String currency) async {
    print(orderID);
    try {
      int amountInCents = (amount * 100).toInt();

      Map<String, dynamic> body = {
        'amount': amountInCents.toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
        // 'metadata': jsonEncode({
        //   'order_id': orderID,
        //   // 'name': firstName.text,
        //   // 'city': street.text,
        //   // 'state': state.text,
        //   // 'country': countrty.text,
        //   // 'email': email.text,
        //   // 'phone_number': contact.text,
        // })

      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51O504PABp6SRG1tAB7E6Q5HWlewVpggeQ0rvm2UUoRHlCsqjUopJN0DZzgucUMZtCncy76au2LZuPDLkb9jbygvn00uu8xAm7C',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        payment_id = result['id'];
        print(response.statusCode);
        int unixTimestamp = result['created'];
        DateTime dateTime =
            DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
        String formattedDateTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
        print('$formattedDateTime');
        print('WWWWWW${result['status']}');
      }
      var result = jsonDecode(response.body);
      payment_id = result['id'];
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> confirmPaymentIntent(String paymentId) async {
    try {
      var paymentIntentId = paymentId;
      var paymentMethodId = 'pm_card_visa';

      var response = await http.post(
        Uri.parse(
            'https://api.stripe.com/v1/payment_intents/$paymentIntentId/confirm'),
        headers: {
          'Authorization':
              'Bearer sk_test_51O504PABp6SRG1tAB7E6Q5HWlewVpggeQ0rvm2UUoRHlCsqjUopJN0DZzgucUMZtCncy76au2LZuPDLkb9jbygvn00uu8xAm7C',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'payment_method': paymentMethodId,
        },
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        // PaymentIntent confirmed successfully
        print('PaymentIntent confirmed successfully.');
      } else {
        // Error occurred while confirming PaymentIntent
        print('Error confirming PaymentIntent: ${response.body}');
      }
    } catch (error) {
      // Error occurred while confirming PaymentIntent
      print('Error confirming PaymentIntent: $error');
    }
  }
}

String generateOrderID() {
  Random random = Random();
  // Generate a random number between 100000 and 999999
  int randomNumber = 100000 + random.nextInt(900000);
  print(randomNumber.toString());
  return randomNumber.toString();
}


  String orderID = generateOrderID();
