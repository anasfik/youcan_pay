import 'package:youcan_pay/src/models/model.dart';

class LogoutResponse extends YouCanPayDataModel {
  final bool isLoggedOut;

  LogoutResponse({
    required this.isLoggedOut,
  });

  factory LogoutResponse.fromMap(Map<String, dynamic> map) {
    return LogoutResponse(
      isLoggedOut: map["isLoggedOut"],
    );
  }

  @override
  List<Object?> get props => [isLoggedOut];
}
