part of 'gold_bloc.dart';

abstract class GoldEvent extends Equatable {
  const GoldEvent();

  @override
  List<Object> get props => [];
}

class GetAllGoldEvent extends GoldEvent {}

class RefreshGetAllGoldEvent extends GoldEvent {}
