part of 'last_update_date_cubit.dart';

abstract class LastUpdateDateState extends Equatable {
  const LastUpdateDateState();

  @override
  List<Object> get props => [];
}

class LastUpdateDateInitial extends LastUpdateDateState {}

class ErrorLoadingLastUpdateDateState extends LastUpdateDateState {
  final String message;

  ErrorLoadingLastUpdateDateState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadedLastUpdateDateState extends LastUpdateDateState {
  final String lastUpdateDate;

  LoadedLastUpdateDateState({required this.lastUpdateDate});

  @override
  List<Object> get props => [lastUpdateDate];
}
