import 'package:flutter/material.dart';

class AppColors {
  static Color darkViolet = const Color(0xff513070);
  static Color white = const Color(0xfff6f7f9);
  static Color black = const Color(0xff000000);

  static ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: darkViolet,
      onPrimary: white,
      secondary: black,
      onSecondary: white,
      error: Colors.red,
      onError: black,
      background: white,
      onBackground: darkViolet,
      surface: white,
      onSurface: black);

  static ColorScheme darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 30, 29, 29),
      onPrimary: white,
      secondary: black,
      onSecondary: white,
      error: Colors.red,
      onError: black,
      background: Colors.grey,
      onBackground: darkViolet,
      surface: white,
      onSurface: black);
}
