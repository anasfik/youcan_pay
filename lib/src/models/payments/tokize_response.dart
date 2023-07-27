import 'package:youcan_pay/src/models/model.dart';

/// {@template tokenize_response}
///  Represents the response returned by the tokenize API endpoint.
/// {@endtemplate}
class TokenizeResponse extends YouCanPayDataModel {
  /// The token.
  final String token;

  ///  Creates a new instance of the [TokenizeResponse] class.
  TokenizeResponse({
    required this.token,
  });

  @override
  List<Object?> get props => [token];

  /// Creates a new instance of the [TokenizeResponse] class from a JSON [map].
  factory TokenizeResponse.fromMap(Map<String, dynamic> map) {
    return TokenizeResponse(
      token: map['token']['id'] as String,
    );
  }
}
