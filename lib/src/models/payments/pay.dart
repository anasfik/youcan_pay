import '../model.dart';

/// {@template pay_response}
///  Represents the response returned by the pay API endpoint.
/// {@endtemplate}
class PayResponse extends YouCanPayDataModel {
  /// Weither the pay is success or not.
  final bool isSuccess;

  /// The code of the pay.
  final String code;

  /// The message of the pay.
  final String message;

  /// The unique identifier of the transaction.
  final String transactionId;

  /// The unique identifier of the order.
  final String orderId;

  ///  Creates a new instance of the [PayResponse] class.
  ///
  /// {@macro pay_response}
  PayResponse({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.transactionId,
    required this.orderId,
  });

  @override
  List<Object?> get props => [
        isSuccess,
        code,
        message,
        transactionId,
        orderId,
      ];

  /// Creates a new instance of the [PayResponse] class from a JSON [map].
  factory PayResponse.fromMap(Map<String, dynamic> map) {
    return PayResponse(
      isSuccess: map['is_success'] as bool,
      code: map['code'] as String,
      message: map['message'] as String,
      transactionId: map['transaction_id'] as String,
      orderId: map['order_id'] as String,
    );
  }
}
