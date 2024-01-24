import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';

import '../prescription/my_prescription.dart';
import '../visits/my_visits.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key});

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  String? selectedValue = '0';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("My Appointment")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        color: Color(0xFF1F2260),
                      ),
                      child: const Text(
                        'Patient Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Reg. NO: '),
                                  Text('784541'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Mobile NO: '),
                                  Text('998784541'),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Text('Patient Name: '),
                              Text('Adit'),
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Text('Email ID: '),
                              Text('adi@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text('Search Appointment for: '),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 8),
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
                  hint: const Text('Select an option'), // Optional hint text
                  isExpanded: true,

                ),
              ),
              const SizedBox(height: 10),
              const Text('Select Status: '),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 8),
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
                  hint: const Text('Select an option'), // Optional hint text
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const  MyVisit(),));
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
                      'Appointment List',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Count 12',
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
                  itemCount: 2, // Adjust the itemCount based on your actual data
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Date:\n04/12/2024'),
                                Text('Shift:\nAfternoon'),
                                Text('Time From: \nN/A'),
                                Text('Time To: \nN/A'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: size.width,
                            color: AppColors.secondary.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                            child: const Text(
                              'Consultant: Ranjan Doctor',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                const Text("Appt. For: Consultation"),
                                const Text("Status: "),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.amber,
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: const Text('Pending'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:  [
                                Container(
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.white),
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
