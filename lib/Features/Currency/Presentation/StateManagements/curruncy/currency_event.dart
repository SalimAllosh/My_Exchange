part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class GetAllCurrenciesEvent extends CurrencyEvent {}

class RefreshGetAllCurrenciesEvent extends CurrencyEvent {}

class GetLastUpdateDateEvent extends CurrencyEvent {}

class RefreshGetLastUpdateDateEvent extends CurrencyEvent {}
