import 'package:youcan_pay/src/exceptions/export.dart';


class YouCanPayExceptionDecidedByStatusCode {
  final int statusCode;

  YouCanPayExceptionDecidedByStatusCode({
    required this.statusCode,
  });

  YouCanPayException call(String message) {
    switch (statusCode) {
      case 400:
        return YouCanPayBadRequestException(
          message: message,
          statusCode: statusCode,
        );
      case 401:
        return YouCanPayUnAuthorizedException(
          message: message,
          statusCode: statusCode,
        );
      case 422:
        return YouCanPayUnprocessableEntityException(
          message: message,
          statusCode: statusCode,
        );
      case 404:
        return YouCanPayNotFoundException(
          message: message,
          statusCode: statusCode,
        );
      case 500:
        return YouCanPayServerErrorException(
          message: message,
          statusCode: statusCode,
        );
      default:
        return UnknownYouCanPayException(
          message: message,
          statusCode: statusCode,
        );
    }
  }
}
