import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFF9933),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFF9933),
        brightness: Brightness.dark,
      ),
    );
  }
}

class AppColor {
  static const Color primaryColor = Color(0xFFFF9933);
  static const Color pageBackground = Colors.white;
}
