import 'package:flutter/material.dart';

class DateOfBirthDropDown extends StatefulWidget {
  @override
  _DateOfBirthDropDownState createState() => _DateOfBirthDropDownState();
}

class _DateOfBirthDropDownState extends State<DateOfBirthDropDown> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.grey,
      child: DropdownButtonFormField<String>(
        value: selectedOption,
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
          });
        },
        items: const [
          DropdownMenuItem(
            value: 'Year',
            child: Text('Year'),
          ),
          DropdownMenuItem(
            value: 'Month',
            child: Text('Month'),
          ),
          DropdownMenuItem(
            value: 'Day',
            child: Text('Day'),
          ),
        ],
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          labelText: selectedOption,
        ),
      ),
    );
  }
}
