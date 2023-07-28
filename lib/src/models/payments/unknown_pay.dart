import 'package:youcan_pay/src/models/payments/pay_response.dart';

/// {@template unknown_pay_response}
///   The response of the unknown payment.
/// {@endtemplate}
class UnknownPayResponse extends PayResponse {
  /// The decoded json response of the unknown payment.
  final Map<String, dynamic> decodedJsonResponse;

  /// Creates a new [UnknownPayResponse] instance.
  ///
  /// {@macro unknown_pay_response}
  UnknownPayResponse({
    required this.decodedJsonResponse,
  });

  @override
  List<Object?> get props => [decodedJsonResponse];
}
