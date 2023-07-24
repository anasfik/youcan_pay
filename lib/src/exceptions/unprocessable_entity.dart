import 'exception.dart';

/// {@template youcan_pay_unprocessable_entity_exception}
///  Exception thrown when a 422 response is received.
/// {@endtemplate}
final class YouCanPayUnprocessableEntityException extends YouCanPayException {
  YouCanPayUnprocessableEntityException({
    required super.message,
    super.statusCode = 422,
  });
}
