import 'package:equatable/equatable.dart';

class TokenizeResponse extends Equatable {
  final String transactionId;
  final String token;

  TokenizeResponse({
    required this.transactionId,
    required this.token,
  });

  @override
  List<Object?> get props => [
        transactionId,
        token,
      ];

  factory TokenizeResponse.fromMap(Map<String, dynamic> map) {
    return TokenizeResponse(
      transactionId: map['transaction_id'] as String,
      token: map['token'] as String,
    );
  }
}
