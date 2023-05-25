import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Entities/currency.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<Currency>>> getAllCurrencies();
  Future<Either<Failure, double>> convert(
      String from, String to, double ammount);
  Future<Either<Failure, String>> getLastUpdateDate();
}
