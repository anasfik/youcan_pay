import 'exception.dart';

/// {@template youcan_pay_not_found_exception}
///  Exception thrown when a 404 response is received.
/// {@endtemplate}
final class YouCanPayNotFoundException extends YouCanPayException {
  YouCanPayNotFoundException({
    required super.message,
    super.statusCode = 404,
  });
}
