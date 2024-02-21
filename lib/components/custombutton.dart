import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.width = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary), // Replace 'Colors.blue' with your desired color
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white,),

        ),
      ),
    );
  }
}
