import 'package:bloc/bloc.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Usecases/get_update_date.dart';
import 'package:equatable/equatable.dart';

part 'last_update_date_state.dart';

class LastUpdateDateCubit extends Cubit<LastUpdateDateState> {
  final GetLastUpdateDateUsecase getLastUpdateDateUsecase;

  LastUpdateDateCubit({required this.getLastUpdateDateUsecase})
      : super(LastUpdateDateInitial());

  void getLastUpdateDate() async {
    final failorDate = await getLastUpdateDateUsecase();
    failorDate.fold((l) {
      emit(ErrorLoadingLastUpdateDateState(message: "fail"));
    }, (r) {
      emit(LoadedLastUpdateDateState(lastUpdateDate: r));
    });
  }
}






// else if (event is GetLastUpdateDateEvent) {
//         final date = await getLastUpdateDateUsecase();
//         date.fold(
//           (l) => emit(ErrorLoadingLastUpdateDateState(message: "error update")),
//           (r) => emit(
//             LoadedLastUpdateDateState(lastUpdateDate: r),
//           ),
//         );
//         //emit(LoadedLastUpdateDateState(lastUpdateDate: lastUpdateDate))
//       }
