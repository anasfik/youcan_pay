import 'package:equatable/equatable.dart';

import '../model.dart';

class WithdrawalResponse extends YouCanPayDataModel {
  final String message;

  WithdrawalResponse({
    required this.message,
  });

  @override
  List<Object?> get props => [message];

  @override
  factory WithdrawalResponse.fromMap(Map<String, dynamic> map) {
    return WithdrawalResponse(
      message: map["message"],
    );
  }
}
