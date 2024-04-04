import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialization;

  Doctor({required this.name, required this.specialization});
}

class MyDoctorSearchList extends StatefulWidget {
  final List<Doctor> doctors;

  const MyDoctorSearchList({Key? key, required this.doctors}) : super(key: key);

  @override
  _MyDoctorSearchListState createState() => _MyDoctorSearchListState();
}

class _MyDoctorSearchListState extends State<MyDoctorSearchList> {
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
        title: Text('Doctor Search List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                          hintText: 'Search by Doctor Name',
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

            Center(child: Text("Empty Doctor List"),),
            Center(
              child: Container(
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-photo/clipboard-wireless-keyboard-cup-coffee-stethoscope-green-desk_23-2148213966.jpg?w=1380&t=st=1705922340~exp=1705922940~hmac=75579330cfbb594ffff9e932445a60ab27d086d1e5f5a849aed4c785ae01afaa"),
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
                    builder: (context) => MyDoctorSearchList(doctors: doctors),
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
