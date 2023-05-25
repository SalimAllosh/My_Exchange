import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoCachedDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}
