// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../model.dart';

class LoginResponse extends YouCanPayDataModel {
  final String token;

  LoginResponse({
    required this.token,
  });

  @override
  List<Object?> get props => [token];

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(token: map["token"]);
  }
}
