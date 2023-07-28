import '../youcan_model.dart';

/// {@template login_response}
/// A model class representing the response of a login request.
///
/// This class extends the `YouCanPayDataModel` class and contains a `token`
/// property which is a string representing the authentication token returned
/// by the server.
/// {@endtemplate}
class LoginResponse extends YouCanPayDataModel {
  /// The authentication token returned by the server.
  final String token;

  /// {@macro login_response}
  ///
  /// The [token] parameter is required and represents the authentication token
  /// returned by the server.
  LoginResponse({
    required this.token,
  });

  @override
  List<Object?> get props => [token];

  /// Creates a new instance of the [LoginResponse] class from a JSON [map].
  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(token: map["token"]);
  }
}
