part of 'language_cubit.dart';

class LanguageChangedState {
  final String languageCode;

  LanguageChangedState({required this.languageCode});
  @override
  List<Object> get props => [languageCode];
}
