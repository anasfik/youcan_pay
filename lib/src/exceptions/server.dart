import 'exception.dart';

/// {@template youcan_pay_server_error_exception}
///  Exception thrown when a 500 response is received.
/// {@endtemplate}
final class YouCanPayServerErrorException extends YouCanPayException {
  YouCanPayServerErrorException({
    required super.message,
    super.statusCode = 500,
  });
}
