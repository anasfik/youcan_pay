// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DepositResponse extends Equatable {
  final String tokenId;

  DepositResponse({
    required this.tokenId,
  });

  @override
  List<Object?> get props => [tokenId];

  factory DepositResponse.fromMap(Map<String, dynamic> map) {
    return DepositResponse(
      tokenId: map['token_id'] as String,
    );
  }
}
