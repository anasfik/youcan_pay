import 'package:youcan_pay/src/models/payments/pay_response.dart';

/// {@template unsuccessful_pay_response}
///  The response of the unsuccessful payment.
/// {@endtemplate}
class UnSuccessfulPayResponse extends PayResponse {
  /// The message of the unsuccessful payment.
  final String message;

  /// The code of the unsuccessful payment.
  final String? code;

  /// Creates a new [UnSuccessfulPayResponse] instance.
  ///
  /// {@macro unsuccessful_pay_response}
  UnSuccessfulPayResponse({
    required this.message,
    required this.code,
  });

  factory UnSuccessfulPayResponse.fromMap(Map<String, dynamic> map) {
    return UnSuccessfulPayResponse(
      message: map['message'] as String,
      code: map['code'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}
