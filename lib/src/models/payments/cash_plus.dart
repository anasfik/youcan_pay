
import '../model.dart';

class CashPlusResponse extends YouCanPayDataModel {
  final String tokenId;

  CashPlusResponse({
    required this.tokenId,
  });

  @override
  List<Object?> get props => [tokenId];

  factory CashPlusResponse.fromMap(Map<String, dynamic> map) {
    return CashPlusResponse(
      tokenId: map['token']['id'] as String,
    );
  }
}
