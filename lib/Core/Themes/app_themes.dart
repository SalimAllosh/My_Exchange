import 'package:currency_and_gold_app/Core/Themes/Colors/app_color.dart';
import 'package:currency_and_gold_app/Core/Themes/FontsStyles/app_font_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: TextTheme(
        displayMedium: AppFontStyles.explainText,
        displayLarge: AppFontStyles.displayLarge,
        titleMedium: AppFontStyles.explainTextBold,
        titleLarge: AppFontStyles.largeTextBold,
        bodyLarge: AppFontStyles.explainTextBold),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: TextTheme(
        displayMedium: AppFontStyles.explainText,
        displayLarge: AppFontStyles.displayLarge,
        titleMedium: AppFontStyles.explainTextBold,
        titleLarge: AppFontStyles.largeTextBold,
        bodyLarge: AppFontStyles.explainTextBold),
  );
}
