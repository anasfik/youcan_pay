
import '../model.dart';

class PayResponse extends YouCanPayDataModel {
  final bool success;
  final bool isSuccess;
  final String code;
  final String message;
  final String transactionId;
  final String orderId;

  PayResponse({
    required this.success,
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.transactionId,
    required this.orderId,
  });

  @override
  List<Object?> get props => [
        success,
        isSuccess,
        code,
        message,
        transactionId,
        orderId,
      ];

  factory PayResponse.fromMap(Map<String, dynamic> map) {
    return PayResponse(
      success: map['success'] as bool,
      isSuccess: map['is_success'] as bool,
      code: map['code'] as String,
      message: map['message'] as String,
      transactionId: map['transaction_id'] as String,
      orderId: map['order_id'] as String,
    );
  }
}
