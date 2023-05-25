import 'package:currency_and_gold_app/Core/Failures/exceptions.dart';
import 'package:currency_and_gold_app/Core/NetworkChecker/internet_connection_checker.dart';
import 'package:currency_and_gold_app/Features/Gold/Data/DataSources/remote_data_source.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Entity/gold_repository.dart';
import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Repository/gold_repository.dart';
import 'package:dartz/dartz.dart';

class GoldRepositoryImp extends GoldRepository {
  final GoldRemoteDataSource remoteDataSource;
  final NetworkInfoImp networkInfoImp;

  GoldRepositoryImp(
      {required this.remoteDataSource, required this.networkInfoImp});

  @override
  Future<Either<Failure, List<Gold>>> getAllGold() async {
    if (await networkInfoImp.isConnected) {
      try {
        final goldList = await remoteDataSource.getAllGold();
        return Right(goldList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
