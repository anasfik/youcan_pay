import '../youcan_model.dart';
import 'pay_response.dart';

/// {@template pay_response}
///  Represents the response returned by the pay API endpoint.
/// {@endtemplate}
class SuccessfulPayResponse extends PayResponse {
  /// The code of the pay.
  final String code;

  /// The message of the pay.
  final String message;

  /// The unique identifier of the transaction.
  final String transactionId;

  /// The unique identifier of the order.
  final String orderId;

  ///  Creates a new instance of the [SuccessfulPayResponse] class.
  ///
  /// {@macro pay_response}
  SuccessfulPayResponse({
    required this.code,
    required this.message,
    required this.transactionId,
    required this.orderId,
  });

  @override
  List<Object?> get props => [
        code,
        message,
        transactionId,
        orderId,
      ];

  /// Creates a new instance of the [SuccessfulPayResponse] class from a JSON [map].
  static SuccessfulPayResponse fromMap(Map<String, dynamic> map) {
    return SuccessfulPayResponse(
      code: map['code'] as String,
      message: map['message'] as String,
      transactionId: map['transaction_id'] as String,
      orderId: map['order_id'] as String,
    );
  }
}
