// ignore_for_file: non_constant_identifier_names

class AppURIs {
  static String BASE_URI = "https://mychangeab.se/exchange/api/";
  static String GET_CURRENCIES_URI = "${BASE_URI}list.php";
  static String GET_GOLD_URI = "${BASE_URI}gold.php";
  static String CONVERT_CURRENCY_URI(String from, String to, double ammount) {
    return "${BASE_URI}convert.php?from=$from&to=$to&amount=$ammount";
  }

  static Map<String, String> REQUEST_HEADER = {
    'Content-Type': 'application/json; charset=UTF-8'
  };
}
