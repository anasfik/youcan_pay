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
}
