// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../model.dart';

class RegisterResponse extends YouCanPayDataModel {
  final String message;

  RegisterResponse({
    required this.message,
  });

  @override
  List<Object?> get props => [message];

  @override
  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      message: map["message"],
    );
  }
}
