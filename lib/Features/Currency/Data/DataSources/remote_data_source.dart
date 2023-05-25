import 'dart:convert';
import 'package:currency_and_gold_app/Core/APIs/uris_constants.dart';
import 'package:currency_and_gold_app/Core/Failures/exceptions.dart';
import 'package:currency_and_gold_app/Features/Currency/Data/Modules/currency_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<CurrencyModel>> getAllCurrencies();
  Future<double> convert(String from, String to, double ammount);
}

class RemoteDataSourceWithHttp extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceWithHttp({required this.client});

  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    try {
      final response = await client.get(Uri.parse(AppURIs.GET_CURRENCIES_URI),
          headers: AppURIs.REQUEST_HEADER);
      if (response.statusCode == 200) {
        List decodedJson = json.decode(response.body) as List;

        final List<CurrencyModel> currenciesList = decodedJson
            .map<CurrencyModel>(
                (currencyModel) => CurrencyModel.fromJson(currencyModel))
            .toList();
        return currenciesList;
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<double> convert(String from, String to, double ammount) async {
    final response = await client.get(
        Uri.parse(AppURIs.CONVERT_CURRENCY_URI(from, to, ammount)),
        headers: AppURIs.REQUEST_HEADER);

    if (response.statusCode == 200) {
      return double.parse(response.body);
    } else {
      throw ServerException();
    }
  }
}
