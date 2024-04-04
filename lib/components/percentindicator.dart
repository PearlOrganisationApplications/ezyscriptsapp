import 'package:ezyscripts/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressIndicatorContainer extends StatelessWidget {
  final double percent;
  final String text;

  const ProgressIndicatorContainer({Key? key, required this.percent,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      center: Text(text,style: TextStyle(color: Colors.white),),
      percent: percent, // Use the provided percent parameter
      barRadius: Radius.circular(20),
      progressColor: AppColors.primary,
      lineHeight: 25,
    );
  }
}
