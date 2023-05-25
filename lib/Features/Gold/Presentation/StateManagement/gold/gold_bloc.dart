import 'package:bloc/bloc.dart';
import 'package:currency_and_gold_app/Core/Failures/failures.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Entity/gold_repository.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Usecase/get_gold_usecase.dart';
import 'package:equatable/equatable.dart';

part 'gold_event.dart';
part 'gold_state.dart';

class GoldBloc extends Bloc<GoldEvent, GoldState> {
  final GetGoldUsecase getGoldUsecase;

  GoldBloc({required this.getGoldUsecase}) : super(GoldInitial()) {
    on<GoldEvent>((event, emit) async {
      if (event is GetAllGoldEvent) {
        emit(LoadingGoldState());

        final failureOrGolds = await getGoldUsecase();

        failureOrGolds.fold(
          (failure) => emit(
              ErrorLoadingGoldState(message: mapFailureToMessage(failure))),
          (golds) => emit(
            LoadedGoldState(golds: golds),
          ),
        );
      } else if (event is RefreshGetAllGoldEvent) {
        emit(LoadingGoldState());

        final failureOrGolds = await getGoldUsecase();

        failureOrGolds.fold(
          (failure) => emit(
              ErrorLoadingGoldState(message: mapFailureToMessage(failure))),
          (golds) => emit(
            LoadedGoldState(golds: golds),
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
