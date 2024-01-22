import 'package:flutter/material.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("My Appointment")),
      body: Expanded(
        child: Column(
          children: [
            Container(
              width: size.width * 0.90,
              height: size.height * 0.30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
            ),
          ],
        ),
      ),
    );
  }
}
