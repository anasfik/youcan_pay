// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
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
