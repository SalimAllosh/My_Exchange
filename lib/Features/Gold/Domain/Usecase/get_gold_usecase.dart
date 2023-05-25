import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Entity/gold_repository.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Repository/gold_repository.dart';
import 'package:dartz/dartz.dart';

class GetGoldUsecase {
  final GoldRepository goldRepository;

  GetGoldUsecase({required this.goldRepository});

  Future<Either<Failure, List<Gold>>> call() async {
    return goldRepository.getAllGold();
  }
}
