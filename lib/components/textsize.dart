import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle titleStyle() {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle subtitleStyle() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    );
  }

  static TextStyle heading1Style() {
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );
  }

// Add more methods for other font sizes as needed
}
