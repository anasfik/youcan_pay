import 'package:equatable/equatable.dart';

class WithdrawalResponse extends Equatable {
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
