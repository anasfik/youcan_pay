abstract class YouCanPayConstants {
  static bool isSandbox = false;

  static String baseUrl =
      "https://youcanpay.com/${isSandbox ? 'sandbox/' : ''}api";

  static YouCanPayEndpointConstants get endpoints =>
      YouCanPayEndpointConstants();
}

class YouCanPayEndpointConstants {
  final tokenize = "tokenize";
  final init = "init";
  final cashplus = "cashplus";
  final pay = "pay";
  final authorize = "authorize";
  final account = "account";
  final register = "register";
  final login = "login";
  final me = "me";
  final password = "password";
  final stats = "stats";
  final refresh = "refresh";
  final logout = 'logout';
  final currency = "currency";
  final conversionRates = "conversion-rates";
  final transfers = "transfers";
}
