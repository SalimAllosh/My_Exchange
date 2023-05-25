import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizationHelper {
  void cacheLocalLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCAL", languageCode);
  }

  Future<String> getCachedLocalLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? languageCode = sharedPreferences.getString("LOCAL");
    if (languageCode == null) {
      return "en";
    } else {
      return languageCode;
    }
  }
}
