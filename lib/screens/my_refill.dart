import 'package:ezyscripts/screens/my_document.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class MyRefill extends StatefulWidget {
  const MyRefill({super.key});

  @override
  State<MyRefill> createState() => _MyRefillState();
}

class _MyRefillState extends State<MyRefill> {
  String? selectedValue = '0';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Refill"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: DropdownButton<String>(
                  underline: const SizedBox(), // Remove the default underline
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Today',
                      child: Text('Today'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Upcoming 15 Days',
                      child: Text('Upcoming 15 Days'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Upcoming 30 Days',
                      child: Text('Upcoming 30 Days'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                    print('Selected: $value');
                  },
                  hint: const Text('Upcoming 15 Days'), // Optional hint text
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: DropdownButton<String>(
                  underline: const SizedBox(), // Remove the default underline
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Pending',
                      child: Text('Pending'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Confirm',
                      child: Text('Confirm'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Cancel',
                      child: Text('Cancel'),
                    ),
                  ],
                  onChanged: (String? value) {
                    print('Selected: $value');
                  },
                  hint: const Text('Refill Allowed'), // Optional hint text
                  isExpanded: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyDocument(),
                        ),
                      );
                    },
                    child: Container(
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F2260),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(
                        child: Text(
                          'Show',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(
                        child: Text(
                          'Clear',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Pharmacy: ',
                        style: TextStyle(color: Colors.black),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 4,
                      ),
                      Text(
                        ' Member',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 4,
                      ),
                      Text(
                        ' Not Member',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                width: size.width,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF1F2260),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Refill',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Count 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: size.height * 0.50,
                width: size.width,
                child: ListView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      2, // Adjust the itemCount based on your actual data
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date-Time:\n04/12/2024'),
                                Row(
                                  children: [
                                    Text('Status: '),
                                    Text(
                                      'Active',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width,
                            color: AppColors.secondary.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  'eRx Ref. No: Self-2015',
                                  style: TextStyle(color: AppColors.primary),
                                ),
                                Text(
                                  'Patient ID:2514',
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Drug: Sabadiu luia"),
                          ),
                          Container(
                            width: size.width,
                            color: AppColors.secondary.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                            child: const Text(
                              'Consultant: Espir abnd ',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.primary,
                                      )),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Share',
                                      style:
                                          TextStyle(color: AppColors.primary),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.primary,
                                      )),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'View',
                                      style:
                                          TextStyle(color: AppColors.primary),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.red,
                                      )),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
