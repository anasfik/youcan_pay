import '../model.dart';

/// {@template cash_plus_response}
///   Represents the response returned by the cash plus API endpoint.
/// {@endtemplate}
class CashPlusResponse extends YouCanPayDataModel {
  /// The unique identifier of the token.
  final String tokenId;

  /// The unique identifier of the transaction.
  final String transactionId;

  ///  Creates a new instance of the [CashPlusResponse] class.
  ///
  /// {@macro cash_plus_response}
  CashPlusResponse({
    required this.tokenId,
    required this.transactionId,
  });

  @override
  List<Object?> get props => [tokenId];

  /// Creates a new instance of the [CashPlusResponse] class from a JSON [map].
  factory CashPlusResponse.fromMap(Map<String, dynamic> map) {
    return CashPlusResponse(
      tokenId: map['token'] as String,
      transactionId: map['transaction_id'] as String,
    );
  }
}
