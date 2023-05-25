import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
  final SharedPreferences sharedPreferences;

  ModeCubit({required this.sharedPreferences}) : super(ModeInitial()) {
    _executeOnInit();
  }

  void _executeOnInit() {
    getMode();
  }

  void getMode() {
    final mode = sharedPreferences.getString("MODE");
    if (mode == null) {
      emit(IsLightState());
    }
    if (mode == "DARK") {
      emit(IsDarkState());
    } else {
      emit(IsLightState());
    }
  }

  bool isDark() {
    final mode = sharedPreferences.getString("MODE");
    if (mode == "DARK") {
      return true;
    } else {
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  void ToggleState() {
    final mode = sharedPreferences.getString("MODE");
    if (mode == null) {
      sharedPreferences.setString("MODE", "LIGHT");
      emit(IsLightState());
    }
    if (mode == "DARK") {
      sharedPreferences.setString("MODE", "LIGHT");
      emit(IsLightState());
    } else if (mode == "LIGHT") {
      sharedPreferences.setString("MODE", "DARK");
      emit(IsDarkState());
    }
  }
}
