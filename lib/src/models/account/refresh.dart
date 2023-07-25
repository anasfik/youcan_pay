import 'login.dart';

class RefreshResponse extends LoginResponse {
  final int expiresIn;

  RefreshResponse({
    required super.token,
    required this.expiresIn,
  });

  factory RefreshResponse.fromMap(Map<String, dynamic> map) {
    return RefreshResponse(
      token: map["token"],
      expiresIn: map["expires_in"],
    );
  }
}
