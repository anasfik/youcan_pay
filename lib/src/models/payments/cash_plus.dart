import '../model.dart';

class CashPlusResponse extends YouCanPayDataModel {
  final String tokenId;
  final String transactionId;

  CashPlusResponse({
    required this.tokenId,
    required this.transactionId,
  });

  @override
  List<Object?> get props => [tokenId];

  factory CashPlusResponse.fromMap(Map<String, dynamic> map) {
    return CashPlusResponse(
      tokenId: map['token'] as String,
      transactionId: map['transaction_id'] as String,
    );
  }
}
