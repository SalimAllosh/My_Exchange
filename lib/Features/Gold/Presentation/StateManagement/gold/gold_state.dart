part of 'gold_bloc.dart';

abstract class GoldState extends Equatable {
  const GoldState();

  @override
  List<Object> get props => [];
}

class GoldInitial extends GoldState {}

class LoadingGoldState extends GoldState {}

class LoadedGoldState extends GoldState {
  final List<Gold> golds;

  LoadedGoldState({required this.golds});

  @override
  List<Object> get props => [golds];
}

class ErrorLoadingGoldState extends GoldState {
  final String message;

  ErrorLoadingGoldState({required this.message});

  @override
  List<Object> get props => [message];
}
