import 'package:flutter/material.dart';

class GenderDropDown extends StatefulWidget {
  @override
  _GenderDropDownState createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  String? _selectedOption;




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.grey,
      child: DropdownButtonFormField<String>(
        value: _selectedOption,
        onChanged: (String? newValue) {
          setState(() {
            _selectedOption = newValue;
            print(newValue);

          });
        },
        items: const [
          DropdownMenuItem(
            value: 'Male',
            child: Text('Male'),
          ),
          DropdownMenuItem(
            value: 'Feamle',
            child: Text('Female'),
          ),
          DropdownMenuItem(
            value: 'Others',
            child: Text('Others'),
          ),
        ],
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          labelText: _selectedOption,
        ),
      ),
    );
  }

}
