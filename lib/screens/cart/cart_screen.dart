import 'package:ezyscripts/components/custombutton.dart';
import 'package:ezyscripts/constant/app_string.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/main.dart';
import 'package:ezyscripts/screens/verify_details/verify_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/totalprice controller.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int? installment;
  int? selectedValue;
  String? selectedOption;
  int result = 0;
  int consultPrice = 30;
  bool isOrderSubscription = false;
  final request = TotalPriceCalculate();
  List<String>prices=[];
  List<int> _quantities = List.filled(myResponse!.scriptDetails.length, 1);
  double totalPrice=myResponse!.subTotal+30.0;
  var subtotal=myResponse!.subTotal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cart,
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Product',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Price',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Quantity',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'SubTotal',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                myResponse!.scriptDetails.isNotEmpty
                    ? scriptsDetails()
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                myResponse!.certificateDetails.isNotEmpty
                    ? medicalCertificate()
                    : Container(),
                myResponse!.consultationDetail.isNotEmpty
                    ? requestConsulation()
                    : Container(),
                myResponse!.referalsDetails.isNotEmpty
                    ? specialistReferals()
                    : Container(),
                myResponse!.referalsDetails.isNotEmpty
                    ? bloodTestData()
                    : Container(),
                // bloodTest(),
                subTotal(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget scriptsDetails() {
    var medicalCertificates = myResponse!.scriptDetails;
    final priceController = Provider.of<RequestController>(context);
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: myResponse!.scriptDetails.length,
        itemBuilder: (context, index) {
          final price =0;
          var getCart = myResponse!.scriptDetails;
          if (myResponse!.scriptDetails.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            ); // Return a placeholder text if _cardDetails is null
          }
          void incrementQuantity(int index) {
            setState(() {
              _quantities[index]++;
              double price = double.parse(getCart[index].productPrice.substring(1));
              totalPrice +=  price;
              subtotal+=price;
              // Increase quantity by 1 for the specified index
            });
          }
          void decrement(int index) {
            setState(() {
              if (_quantities[index] > 1) {
                _quantities[index]--;
                // Calculate price based on quantity change
                double price = double.parse(getCart[index].productPrice.substring(1));
                totalPrice -= price;
                subtotal-=price;
                // Decrease quantity by 1 for the specified index
              }
            });
          }
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scripts Details',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Product:${getCart[index].medicareCardNo.toString()}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${getCart[index].productPrice}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: screenSize.height * .09,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                incrementQuantity(index);
                                // priceController.increment();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200],
                                ),
                                child: Icon(Icons.add, size: 15),
                              ),
                            ),
                            Text(
                              '${_quantities[index]}',
                              style: TextStyle(fontSize: 20),
                            ),
                            GestureDetector(
                              onTap: () {
                                decrement(index);
                                // priceController.decrement();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200],
                                ),
                                child: Icon(Icons.remove, size: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${getCart[index].productPrice}',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Text(
                    'Ref No:${getCart[index].refNo.toString()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'concessionCardNo:${getCart[index].concessionCardNo.toString()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'cardColor:${getCart[index].cardColor}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Dva Num:${getCart[index].dvaNo}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Chronic List: ${getCart[index].chronicDesc?.join(', ')}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget subTotal() {
    var getCart = myResponse!.subTotal;
    print('BBBB${allProductPrice}');
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: screenSize.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Enable Order Subscription',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Checkbox(
                value: isOrderSubscription,
                onChanged: (newValue) {
                  setState(() {
                    isOrderSubscription = newValue!;
                  });
                },
              )
            ],
          ),
          isOrderSubscription
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Renewal frequency',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'every ',
                    ),
                    Column(
                      children: [
                        DropdownButton<int>(
                          value: selectedValue,
                          items: List.generate(
                              100,
                              (index) => DropdownMenuItem<int>(
                                    value: index + 1,
                                    child: Text((index + 1).toString()),
                                  )),
                          onChanged: (int? value) {
                            setState(() {
                              selectedValue = value;
                            });
                            print('Selected: $value');
                          },
                        ),
                        DropdownButton<String>(
                          value: selectedOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue;
                            });
                          },
                          items: <String>['Day', 'Week', 'Month', 'Year']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  ],
                )
              : Container(),
          isOrderSubscription
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Number of installments'),
                    DropdownButton<int>(
                      value: installment,
                      items: List.generate(50, (index) {
                        return DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text('${index + 1} Installment'),
                        );
                      }),
                      onChanged: (int? value) {
                        setState(() {
                          installment = value;
                        });
                        print('Selected: $value');
                      },
                    )
                  ],
                )
              : Container(),
          SizedBox(
            height: 12,
          ),
          Text(
            'CART TOTALS',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'SUBTOTAL',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
               '\$${ subtotal.toString()}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'CONSULT FEES',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                '\$${consultPrice.toString()}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'TOTAL',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                '\$${totalPrice}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Proceed to checkOut',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyDetails(),
                  ));
            },
            width: screenSize.width * .9,
          )
        ],
      ),
    );
  }

  Widget medicalCertificate() {
    var medicalCertificates = myResponse!.certificateDetails;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: medicalCertificates.length,
      itemBuilder: (context, index) {
        var certificateDetail = medicalCertificates[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medical Certificate',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: AppColors.primary,
                ),
                SizedBox(height: 10),
                Text(
                  'Price: ${certificateDetail.price}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Product: ${certificateDetail.medicareCardNo.toString()}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Price: ${certificateDetail.price}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Ref No: ${certificateDetail.refNo.toString()}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'ConcCard num: ${certificateDetail.concessionCardNo.toString()}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Card Color: ${certificateDetail.cardColor}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Dva Num: ${certificateDetail.dvaNo}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Title: ${certificateDetail.title}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget requestConsulation() {
    var coonsultationDetail = myResponse!.consultationDetail;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: coonsultationDetail.length,
      itemBuilder: (context, index) {
        var getCart = myResponse!.consultationDetail;
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Request Consulation',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  color: AppColors.primary,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${getCart[index].price}',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Product:${getCart[index].medicareCardNo.toString()}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${getCart[index].price}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Ref No:${getCart[index].refNo.toString()}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ConcCard num:${getCart[index].concessionCardNo.toString()}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Card Color:${getCart[index].cardColor}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Dva Num:${getCart[index].dvaNo}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Chronic List: ${getCart[index].chronicDesc.join(', ')}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget specialistReferals() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          var getCart = myResponse!.referalsDetails;
          if (myResponse!.referalsDetails.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            ); // Return a placeholder text if _cardDetails is null
          }
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SpecialistReferals',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${getCart[index].price}',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Product:${getCart[index].medicareCardNo.toString()}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${getCart[index].price}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ref No:${getCart[index].refNo.toString()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ConcCard num:${getCart[index].concessionCardNo.toString()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Card Color:${getCart[index].cardColor}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Dva Num:${getCart[index].dvaNo}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Chronic List: ${getCart[index].chronicDesc.join(', ')}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bloodTestData() {
    var medicalCertificates = myResponse!.bloodTestDetail;
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          var getCart = myResponse!.scriptDetails;
          if (myResponse!.scriptDetails.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            ); // Return a placeholder text if _cardDetails is null
          }
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BloodTest',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${medicalCertificates[index].price}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Product:${getCart[index].medicareCardNo.toString()}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${getCart[index].productPrice}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ref No:${getCart[index].refNo.toString()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ConcCard num:${getCart[index].concessionCardNo.toString()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Card Color:${getCart[index].cardColor}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Dva Num:${getCart[index].dvaNo}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Chronic List: ${getCart[index].chronicDesc?.join(', ')}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
