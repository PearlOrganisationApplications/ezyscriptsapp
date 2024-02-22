import 'package:ezyscripts/constant/app_string.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cart,style: TextStyle(color: AppColors.primary,fontSize: 20,fontWeight: FontWeight.w600),),
      ),
      body: Column(
        children: [
          productDetails(),
          cartData()
        ],
      ),
    );
  }
  Widget productDetails(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Product'),
          Text('Price'),
          Text('Quantity'),
          Text('SubTotal')
        ],
      ),
    );
  }
  Widget cartData(){
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
        return Column(children: [
          Text('Asghut')
        ]
        );
      },),
    );
  }
}
