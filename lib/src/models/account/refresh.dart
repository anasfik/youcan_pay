import 'login.dart';

/// {@template refresh_response}
/// A model class representing the response of a token refresh request.
/// {@endtemplate}
class RefreshResponse extends LoginResponse {
  /// The number of seconds until the token expires.
  final int expiresIn;

  /// {@macro refresh_response}
  RefreshResponse({
    required super.token,
    required this.expiresIn,
  });

  /// Creates a new instance of [RefreshResponse] from the given [map].
  factory RefreshResponse.fromMap(Map<String, dynamic> map) {
    return RefreshResponse(
      token: map["token"],
      expiresIn: map["expires_in"],
    );
  }
}
