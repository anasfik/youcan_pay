/// {@template youcan_pay_exception}
/// Base class for all exceptions thrown by the YouCanPay SDK.
/// {@endtemplate}
abstract base class YouCanPayException implements Exception {
  /// The status code of the response.
  final int statusCode;

  /// The message of the response.
  final String message;

  /// {@macro youcan_pay_exception}
  YouCanPayException({
    required this.message,
    required this.statusCode,
  });

  @override
  String toString() {
    return '$runtimeType: $statusCode $message';
  }
}
