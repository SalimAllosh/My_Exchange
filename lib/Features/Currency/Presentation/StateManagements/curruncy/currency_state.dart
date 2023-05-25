part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class LoadingCurrenciesState extends CurrencyState {}

class LoadedCurrenciesState extends CurrencyState {
  final List<Currency> currenciesList;

  LoadedCurrenciesState({required this.currenciesList});

  @override
  List<Object> get props => [currenciesList];
}

class ErrorLoadingCurrenciesState extends CurrencyState {
  final String message;

  ErrorLoadingCurrenciesState({required this.message});

  @override
  List<Object> get props => [message];
}
