import 'package:ezyscripts/screens/my_doctor/my%20doctor.dart';
import 'package:ezyscripts/screens/pharmacy/my_pharmacy.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class MyDocument extends StatefulWidget {
  const MyDocument({super.key});

  @override
  State<MyDocument> createState() => _MyDocumentState();
}

class _MyDocumentState extends State<MyDocument> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Document"),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      width: size.width * 0.45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            label: Text('From Date'),
                            hintText: "03/02/2024"
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      width: size.width * 0.45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            label: Text('From Date'),
                            hintText: "03/02/2024"
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              const Text('Status: '),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: DropdownButton<String>(
                  underline: const SizedBox(), // Remove the default underline
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Pathology',
                      child: Text('Pathology'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Radiology',
                      child: Text('Radiology'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Document',
                      child: Text('Document'),
                    ),
                  ],
                  onChanged: (String? value) {
                    print('Selected: $value');
                  },
                  hint: const Text('Select an option'), // Optional hint text
                  isExpanded: true,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: size.width,
                child: TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Search By Remark'),
                      hintText: ""
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const  MyDoctorSearchList(doctors: []),));
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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const  MyPharmacy(doctors: []),));
                    },
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

            ],
          ),
        ),
      ),
    );
  }
}
