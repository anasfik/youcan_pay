abstract class YouCanPayConstants {
  static const baseUrl = "https://youcanpay.com/api";

  static YouCanPayEndpointConstants get endpoints =>
      YouCanPayEndpointConstants();
}

class YouCanPayEndpointConstants {
  final tokenize = "tokenize";
  final init = "init";
  final cashplus = "cashplus";
}
