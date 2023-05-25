import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class ConvertCurrencyUsecase {
  final CurrencyRepository currencyRepository;

  ConvertCurrencyUsecase({required this.currencyRepository});

  Future<Either<Failure, double>> call(
      String from, String to, double ammount) async {
    return currencyRepository.convert(from, to, ammount);
  }
}
