import 'package:flutter/material.dart';

class AppTheme {
  // * Cores padrões do app
  static const Color primaryColor = Colors.blueAccent;

  static ThemeData customTheme() {
    return ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor
    );
  }
}
