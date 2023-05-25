import 'package:bloc/bloc.dart';
import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Entities/currency.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Usecases/get_all_currency_usecase.dart';
import 'package:equatable/equatable.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final GetAllCurrencyUsecase getAllCurrencyUsecase;

  CurrencyBloc({required this.getAllCurrencyUsecase})
      : super(CurrencyInitial()) {
    on<CurrencyEvent>((event, emit) async {
      if (event is GetAllCurrenciesEvent) {
        emit(LoadingCurrenciesState());

        final failOrCurrencies = await getAllCurrencyUsecase();

        failOrCurrencies.fold((failure) {
          emit(ErrorLoadingCurrenciesState(
              message: mapFailureToMessage(failure)));
        }, (currencies) {
          emit(LoadedCurrenciesState(currenciesList: currencies));
        });
      } else if (event is RefreshGetAllCurrenciesEvent) {
        emit(LoadingCurrenciesState());

        final failOrCurrencies = await getAllCurrencyUsecase();

        failOrCurrencies.fold(
          (failure) => emit(ErrorLoadingCurrenciesState(
              message: mapFailureToMessage(failure))),
          (currencies) => emit(
            LoadedCurrenciesState(currenciesList: currencies),
          ),
        );
      }
    });
  }

  String mapFailureToMessage(Failure failure) {
    if (failure is NoInternetConnectionFailure) {
      return "NO_INTERNET_CONNCTION_MESSAGE";
    }
    if (failure is NoCachedDataFailure) {
      return "NO_CACHED_DATA_MESSAGE";
    }
    if (failure is ServerFailure) {
      return "SERVER_FAILUER_MESSAGE";
    } else {
      return "UnKnown Error , Try Again Later ";
    }
  }
}
