import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Entities/currency.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCurrencyUsecase {
  final CurrencyRepository currencyRepository;

  GetAllCurrencyUsecase({required this.currencyRepository});

  Future<Either<Failure, List<Currency>>> call() async {
    return currencyRepository.getAllCurrencies();
  }
}
