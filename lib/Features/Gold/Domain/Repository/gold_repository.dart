import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Entity/gold_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GoldRepository {
  Future<Either<Failure, List<Gold>>> getAllGold();
}
