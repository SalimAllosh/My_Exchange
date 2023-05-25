import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class GetLastUpdateDateUsecase {
  final CurrencyRepository currencyRepository;

  GetLastUpdateDateUsecase({required this.currencyRepository});

  Future<Either<Failure, String>> call() async {
    return currencyRepository.getLastUpdateDate();
  }
}
