import 'package:flutter/material.dart';

import '../../constant/colors.dart';


class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      body: Center(
        child: Text('Your Cart is Empty'),
      )
    );
  }
}
