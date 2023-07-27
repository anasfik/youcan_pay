import 'package:youcan_pay/src/models/model.dart';

/// {@template invoice_tokenization}
///  Represents the response returned by the invoice tokenization API endpoint.
/// {@endtemplate}
class YouCanInvoiceTokenization extends YouCanPayDataModel {
  /// The public key of the token.
  final String pubKey;

  /// The unique identifier of the token.
  final String tokenId;

  ///  Creates a new instance of the [YouCanInvoiceTokenization] class.
  ///
  /// {@macro invoice_tokenization}
  YouCanInvoiceTokenization({
    required this.pubKey,
    required this.tokenId,
  });

  @override
  List<Object?> get props => [pubKey, tokenId];

  /// Creates a new instance of the [YouCanInvoiceTokenization] class from a JSON [map].
  factory YouCanInvoiceTokenization.fromMap(Map<String, dynamic> map) {
    return YouCanInvoiceTokenization(
      pubKey: map['pub_key'],
      tokenId: map['token_id'],
    );
  }
}
