import 'exception.dart';

/// {@template youcan_pay_unauthorized_exception}
///  Exception thrown when a 401 response is received.
/// {@endtemplate}
final class YouCanPayUnAuthorizedException extends YouCanPayException {
  YouCanPayUnAuthorizedException({
    required super.message,
    super.statusCode = 401,
  });
}
