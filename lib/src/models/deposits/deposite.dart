import '../model.dart';

/// {@template deposit_response}
/// Represents the response returned by the deposit API endpoint.
/// {@endtemplate}
class DepositResponse extends YouCanPayDataModel {
  /// The unique identifier of the token.
  final String tokenId;

  /// Creates a new instance of the [DepositResponse] class.
  ///
  /// {@macro deposit_response}
  DepositResponse({
    required this.tokenId,
  });

  @override
  List<Object?> get props => [tokenId];

  /// Creates a new instance of the [DepositResponse] class from a JSON [map].
  factory DepositResponse.fromMap(Map<String, dynamic> map) {
    return DepositResponse(
      tokenId: map['token_id'] as String,
    );
  }
}
