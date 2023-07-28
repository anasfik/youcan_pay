import 'package:youcan_pay/src/models/youcan_model.dart';

/// Represents the response returned by the logout API endpoint.
///
/// {@template logout_response}
/// This model contains a boolean flag indicating whether the user was successfully logged out.
/// {@endtemplate}
class LogoutResponse extends YouCanPayDataModel {
  /// Whether the user was successfully logged out.
  final bool isLoggedOut;

  /// Creates a new instance of the [LogoutResponse] class.
  ///
  /// {@macro logout_response}
  LogoutResponse({
    this.isLoggedOut = true,
  });

  @override
  List<Object?> get props => [isLoggedOut];
}
