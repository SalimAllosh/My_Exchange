import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale? locale;

  AppLocalization({required this.locale});

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  late Map<String, String> _localizedString;

  Future loadJsonLanguage() async {
    String jsonString = await rootBundle
        .loadString("assets/languages/${locale!.languageCode}.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    _localizedString = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _localizedString[key] ?? "Not Translated ";

  static LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationDelegate();
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) {
    return ["en", "ar", "sv"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale: locale);
    await localization.loadJsonLanguage();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}

extension Translate on String {
  String translate(BuildContext context) {
    return AppLocalization.of(context)!.translate(this);
  }
}
