import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final validator;
  final Function()? onTap;
  final Widget ?suffix;

  CustomTextFormField({
    this.suffix,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(

        onTap: onTap,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: suffix,
          labelText: labelText,
        ),
      ),
    );
  }
}
