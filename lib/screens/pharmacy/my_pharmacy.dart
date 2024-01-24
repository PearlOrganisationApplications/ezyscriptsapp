import 'package:ezyscripts/screens/my_doctor/my%20doctor.dart';
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialization;

  Doctor({required this.name, required this.specialization});
}

class MyPharmacy extends StatefulWidget {
  final List<Doctor> doctors;

  const MyPharmacy({Key? key, required this.doctors}) : super(key: key);

  @override
  _MyPharmacyState createState() => _MyPharmacyState();
}

class _MyPharmacyState extends State<MyPharmacy> {
  TextEditingController _searchController = TextEditingController();
  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = widget.doctors;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              color: Colors.grey.shade300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const  MyDoctorSearchList(doctors: []),));
                    },
                    child: Container(
                      width: size.width * 0.48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F2260),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: const Center(
                        child: Text(
                          'My Pharmacy',
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
                      width: size.width * 0.48,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: const Center(
                        child: Text(
                          'Pending Acceptance',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            filteredDoctors = widget.doctors
                                .where((doctor) => doctor.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search by Pharmacy Name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: filteredDoctors.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(filteredDoctors[index].name),
            //         subtitle: Text(filteredDoctors[index].specialization),
            //         // Add more details or customize ListTile as needed
            //       );
            //     },
            //   ),
            // ),

            Center(child: Text("Empty Pharmacy  List"),),
            Center(
              child: Container(
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/premium-vector/pharmacists_23-2148184173.jpg?w=826"),
                    fit: BoxFit.contain, // Adjust the fit as needed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDoctorEntryScreen extends StatelessWidget {
  final List<Doctor> doctors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Doctor Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Doctor Name'),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Specialization'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to save doctor information
                String doctorName =
                    ''; // Get the doctor name from the TextFormField
                String specialization =
                    ''; // Get the specialization from the TextFormField
                Doctor newDoctor =
                Doctor(name: doctorName, specialization: specialization);
                doctors.add(newDoctor);
              },
              child: Text('Save Doctor'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPharmacy(doctors: doctors),
                  ),
                );
              },
              child: Text('View Doctor List'),
            ),
          ],
        ),
      ),
    );
  }
}
