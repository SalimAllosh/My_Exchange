import 'package:currency_and_gold_app/Core/Themes/Colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppFontStyles {
  static TextStyle bottombarLabels = GoogleFonts.roboto(color: AppColors.white);
  static TextStyle explainText = GoogleFonts.roboto(
      color: AppColors.black, fontSize: SizerUtil.height / 60);
  static TextStyle explainTextBold = GoogleFonts.roboto(
      color: AppColors.black,
      fontSize: SizerUtil.height / 50,
      fontWeight: FontWeight.bold);
  static TextStyle largeTextBold = GoogleFonts.roboto(
      color: AppColors.black,
      fontSize: SizerUtil.height / 32,
      fontWeight: FontWeight.bold);
  static TextStyle displayLarge = GoogleFonts.roboto(
      color: AppColors.black,
      fontSize: SizerUtil.height / 30,
      fontWeight: FontWeight.bold);
}
