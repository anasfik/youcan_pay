import 'exception.dart';

/// {@template unknown_youcanpay_exception}
///  Exception thrown when an unknown exception occurs.
/// {@endtemplate}
final class UnknownYouCanPayException extends YouCanPayException {
  UnknownYouCanPayException({
    required super.message,
    super.statusCode = -1,
  });
}
