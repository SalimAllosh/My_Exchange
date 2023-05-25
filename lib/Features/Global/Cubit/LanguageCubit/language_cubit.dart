import 'package:bloc/bloc.dart';
import 'package:currency_and_gold_app/Core/Localization/app_localization_helper.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageChangedState> {
  LanguageCubit() : super(LanguageChangedState(languageCode: "en"));

  Future<void> getSavedLanguageCode() async {
    final String savedCode =
        await AppLocalizationHelper().getCachedLocalLanguageCode();

    emit(LanguageChangedState(languageCode: savedCode));
  }

  Future<void> changeLanguage(String code) async {
    AppLocalizationHelper().cacheLocalLanguageCode(code);
    emit(LanguageChangedState(languageCode: code));
  }
}
