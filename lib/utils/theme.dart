import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    canvasColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffF9FFFE),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff008CFF)),
    primaryColor: Color(0xff008CFF),
    scaffoldBackgroundColor: Color(0xffF9FFFE),
    textTheme: TextTheme(
      headlineLarge: const TextStyle().copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xff008CFF)),
      headlineMedium: const TextStyle().copyWith(fontSize: 28, fontWeight: FontWeight.w600, color: Color(0xff008CFF)),
      headlineSmall: const TextStyle().copyWith(fontSize: 26, fontWeight: FontWeight.w600, color: Color(0xff008CFF)),

      titleLarge: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
      titleMedium: const TextStyle().copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
      titleSmall: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),

      bodyLarge: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      bodyMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff008CFF),
        disabledBackgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        disabledForegroundColor: Colors.grey,
        textStyle: TextStyle(fontSize: 20, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
      )
    ),
    useMaterial3: true,
  );
}