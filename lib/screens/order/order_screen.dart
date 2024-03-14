import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/components/textformfield.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controller/totalprice controller.dart';
import '../../main.dart';



class OrderDetails extends StatefulWidget {
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final coupon=TextEditingController();
  final cvc=TextEditingController();
  final expiryDate=TextEditingController();
  final cardCode=TextEditingController();
  final cardHolder=TextEditingController();

 bool showCupon=false;

  @override
  Widget build(BuildContext context) {
    print('WWWW${myResponse!.scriptDetails[0].productName}');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              orederDetails(),
              SizedBox(height: 20,),
              paymentMode(),
              SizedBox(height: 20,),
              CustomButton(text: 'Place Order', onPressed: (){},width: screenSize.width*.55,)
            ],
          ),
        ),
      ),
    );
  }

  Widget orederDetails(){
    final request=Provider.of<RequestController>(context);
    return Container(
      alignment: Alignment.center,
      width: screenSize.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
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
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(myResponse!.scriptDetails[index].productName),
                        Text('Medical Card No:${myResponse!.scriptDetails[index].medicareCardNo.toString()} '
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
            TextButton(onPressed: (){
              setState(() {
                showCupon= !showCupon;
              });
            }, child: Text('Have A Coupon? Click Here To Enter Your Code',)),
           showCupon? Text('Coupon Code',style: TextStyle(color: Colors.black),):Container(),
            showCupon? Padding(
              padding: const EdgeInsets.only(left: 4.0,right: 4),
              child: CustomTextFormField(labelText: '', controller: coupon),
            ):Container(),
            showCupon?CustomButton(text: 'Apply', onPressed: (){},width: screenSize.width*.34,):Container(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('OrderTotal',style:TextStyle(color: AppColors.primary,fontSize: 20,fontWeight: FontWeight.w500),),
                    Obx(() => Text(
                      '\$${request.totalPrice}',
                      style: TextStyle(fontSize: 20),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
  Widget paymentMode(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container( width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
           Text('PAYMENT INFORMATION',style:TextStyle(color: AppColors.primary,fontWeight: FontWeight.w500),),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: AppColors.primary,radius: 5,),
                  SizedBox(width: 10,),
                  Text('Credit Card',style:TextStyle(color: AppColors.primary,fontWeight: FontWeight.w500),),
                  SizedBox(width: 10,),
                  Image.asset('assets/images/visa.png'),

                ],
              ),
              Divider(color: Colors.black,),
              Text('(Your Card Details Will Be Securely Saved And Processed By One Of Our Sales Staff)'),
              SizedBox(height: 10,),
              Text('Card Holder *'),
              CustomTextFormField(labelText: 'Card Holder', controller: cardHolder),
              Text('Card Number *'),
              CustomTextFormField(labelText: 'Card Number', controller: cardCode),
              Text('Expiry(YY-MM) *'),
              CustomTextFormField(labelText: 'Expiry(YY-MM)', controller: expiryDate),
              Text('CVC *',style: TextStyle(color: Colors.black),),
              CustomTextFormField(labelText: 'CVC', controller: cvc),
            ],
          ),
        ),
            SizedBox(height: 20,)
          ],
        ),

      ),
    );
  }
}
