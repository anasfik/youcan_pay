import 'exception.dart';

/// {@template youcan_pay_bad_request_exception}
///  Exception thrown when a 400 response is received.
/// {@endtemplate}
final class YouCanPayBadRequestException extends YouCanPayException {
  YouCanPayBadRequestException({
    required super.message,
    super.statusCode = 400,
  });
}
