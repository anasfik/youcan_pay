import 'package:youcan_pay/src/models/model.dart';

class YouCanInvoiceTokenization extends YouCanPayDataModel {
  final String pubKey;
  final String tokenId;

  YouCanInvoiceTokenization({
    required this.pubKey,
    required this.tokenId,
  });

  @override
  List<Object?> get props => [pubKey, tokenId];

  factory YouCanInvoiceTokenization.fromMap(Map<String, dynamic> map) {
    return YouCanInvoiceTokenization(
      pubKey: map['pub_key'],
      tokenId: map['token_id'],
    );
  }
}
