import 'dart:convert';

import 'package:currency_and_gold_app/Core/APIs/uris_constants.dart';
import 'package:currency_and_gold_app/Core/Failures/exceptions.dart';
import 'package:currency_and_gold_app/Features/Gold/Data/Models/gold_model.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Entity/gold_repository.dart';
import 'package:http/http.dart' as http;

abstract class GoldRemoteDataSource {
  Future<List<Gold>> getAllGold();
}

class GoldRemoteDataSourceWithClient extends GoldRemoteDataSource {
  final http.Client client;

  GoldRemoteDataSourceWithClient({required this.client});

  @override
  Future<List<Gold>> getAllGold() async {
    try {
      final response = await client.get(Uri.parse(AppURIs.GET_GOLD_URI),
          headers: AppURIs.REQUEST_HEADER);

      if (response.statusCode == 200) {
        List decodedJson = json.decode(response.body.toString()) as List;

        List<GoldModel> goldList = decodedJson
            .map<GoldModel>((goldmodel) => GoldModel.fromjson(goldmodel))
            .toList();

        return goldList;
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
