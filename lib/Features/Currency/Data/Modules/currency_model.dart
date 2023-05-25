import 'package:currency_and_gold_app/Features/Currency/Domain/Entities/currency.dart';

class CurrencyModel extends Currency {
  CurrencyModel(
      {required super.code,
      required super.currency,
      required super.sell,
      required super.buy,
      required super.flag});

  factory CurrencyModel.fromJson(Map<String, dynamic> jsonData) {
    return CurrencyModel(
        code: jsonData["code"],
        currency: jsonData["currency"],
        sell: jsonData["sell"],
        buy: jsonData["buy"],
        flag: jsonData["flag"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "currency": currency,
      "sell": sell,
      "buy": buy,
      "flag": flag
    };
  }
}
