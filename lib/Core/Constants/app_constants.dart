import 'package:currency_and_gold_app/Features/Currency/Domain/Entities/currency.dart';

class AppConstants {
  static const String phoneNumber = "tel:+971543955336";
  static const String webPageAboutUs = "https://mychangeab.se/en/about-us";
  static late List<Currency> currenciesList = [];
  static List<Currency> get currencies => currenciesList;
}
