import 'package:equatable/equatable.dart';

class CashPlusResponse extends Equatable {
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
