import 'package:currency_and_gold_app/Features/Gold/Domain/Entity/gold_repository.dart';

class GoldModel extends Gold {
  GoldModel(
      {required super.id,
      required super.title,
      required super.content,
      required super.image,
      required super.shortDescription,
      required super.price,
      required super.price5,
      required super.price10,
      required super.buyPrice,
      required super.weight});

  factory GoldModel.fromjson(Map<String, dynamic> data) {
    return GoldModel(
        id: data["id"],
        title: data["title"],
        content: data["content"],
        image: data["image"],
        shortDescription: data["short_description"],
        price: data["price"],
        price5: data["price+5"],
        price10: data["price+10"],
        buyPrice: data["buy_price"],
        weight: data["weight"]);
  }

  Map<String, dynamic> tojson(Gold gold) {
    return {
      "id": gold.id,
      "title": gold.title,
      "content": gold.content,
      "image": gold.image,
      "short_description": gold.shortDescription,
      "price": gold.price,
      "price+5": gold.price5,
      "price+10": gold.price10,
      "buy_price": gold.buyPrice,
      "weight": gold.weight
    };
  }
}
