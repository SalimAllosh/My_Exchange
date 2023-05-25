import 'dart:convert';
import 'package:currency_and_gold_app/Core/Failures/exceptions.dart';
import 'package:currency_and_gold_app/Features/Currency/Data/Modules/currency_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<CurrencyModel>> getCachedData();
  void cachCurrencies(List<CurrencyModel> currencylist);
  Future<String> getLastUpdateDate();
}

class LocalDataSouceWithSharedPreferances extends LocalDataSource {
  static const String cachedData = "CACHED_CURRENCY";
  static const String cachedDate = "CACHED_DATE";
  final SharedPreferences sharedPreferences;

  LocalDataSouceWithSharedPreferances({required this.sharedPreferences});

  @override
  void cachCurrencies(List<CurrencyModel> currencylist) {
    List currencylistToJson = currencylist
        .map<Map<String, dynamic>>((currencyItem) => currencyItem.toJson())
        .toList();

    sharedPreferences.setString(cachedData, jsonEncode(currencylistToJson));
  }

  @override
  Future<List<CurrencyModel>> getCachedData() async {
    final currencyListString = sharedPreferences.getString(cachedData);

    if (currencyListString != null) {
      List decodedCurrencyList = jsonDecode(currencyListString);
      List<CurrencyModel> currencyList = decodedCurrencyList
          .map<CurrencyModel>((currency) => CurrencyModel.fromJson(currency))
          .toList();
      return currencyList;
    } else {
      throw NoCachedDataException();
    }
  }

  @override
  Future<String> getLastUpdateDate() async {
    final stringDate = sharedPreferences.getString(cachedDate);
    if (stringDate != null) {
      return stringDate;
    } else {
      throw NoCachedDataException();
    }
  }
}
