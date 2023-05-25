import 'package:currency_and_gold_app/Core/Failures/exceptions.dart';
import 'package:currency_and_gold_app/Features/Currency/Data/DataSources/local_data_source.dart';
import 'package:currency_and_gold_app/Features/Currency/Data/DataSources/remote_data_source.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Entities/currency.dart';
import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Repositories/currency_repository.dart';
import 'package:currency_and_gold_app/Core/NetworkChecker/internet_connection_checker.dart';
import 'package:dartz/dartz.dart';

class CurrencyRepositoryImp extends CurrencyRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfoImp networkInfoImp;

  CurrencyRepositoryImp(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfoImp});

  @override
  Future<Either<Failure, List<Currency>>> getAllCurrencies() async {
    if (await networkInfoImp.isConnected) {
      try {
        final currencylist = await remoteDataSource.getAllCurrencies();
        localDataSource.cachCurrencies(currencylist);
        return Right(currencylist);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final currencyList = await localDataSource.getCachedData();
        return Right(currencyList);
      } on NoCachedDataException {
        return Left(NoCachedDataFailure());
      }
    }
  }

  @override
  Future<Either<Failure, double>> convert(
      String from, String to, double ammount) async {
    if (await networkInfoImp.isConnected) {
      try {
        final result = await remoteDataSource.convert(from, to, ammount);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getLastUpdateDate() async {
    if (await networkInfoImp.isConnected) {
      return Right(DateTime.now().toString());
    } else {
      try {
        final date = await localDataSource.getLastUpdateDate();
        return Right(date);
      } on NoCachedDataException {
        return Left(NoCachedDataFailure());
      }
    }
  }
}
