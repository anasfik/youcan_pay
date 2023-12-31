abstract class YouCanPayConstants {
  static bool isSandbox = false;

  static String baseUrl = "https://youcanpay.com/api";
  static String sandboxBaseUrl = "https://youcanpay.com/sandbox/api";

  static YouCanPayEndpointConstants get endpoints =>
      YouCanPayEndpointConstants();
}

class YouCanPayEndpointConstants {
  final tokenize = "tokenize";
  final apiTokenize = "api/tokenize";
  final init = "init";
  final cashplus = "cashplus";
  final pay = "pay";
  final authorize = "authorize";
  final account = "account";
  final accounts = "accounts";
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
  final deposits = "deposits";
  final recent = "recent";
  final invoices = 'invoices';
  final balanceHistory = 'balance-history';
  final withdrawals = "withdrawals";
  final getAccountConfigs = "get-account-configs";
}
