import 'package:youcan_pay/src/models/model.dart';

class TokenizeResponse extends YouCanPayDataModel {
  final String token;

  TokenizeResponse({
    required this.token,
  });

  @override
  List<Object?> get props => [token];

  factory TokenizeResponse.fromMap(Map<String, dynamic> map) {
    return TokenizeResponse(
      token: map['token']['id'] as String,
    );
  }
}
