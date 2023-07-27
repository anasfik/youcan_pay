import '../model.dart';

/// {@template withdrawal_response}
/// Represents the response returned by the withdrawal API endpoint.
/// {@endtemplate}
class WithdrawalResponse extends YouCanPayDataModel {
  /// The message returned by the withdrawal API endpoint.
  final String message;

  /// Creates a new instance of the [WithdrawalResponse] class.
  ///
  /// {@macro withdrawal_response}
  WithdrawalResponse({
    required this.message,
  });

  @override
  List<Object?> get props => [message];

  /// Creates a new instance of the [WithdrawalResponse] class from a JSON [map].
  @override
  factory WithdrawalResponse.fromMap(Map<String, dynamic> map) {
    return WithdrawalResponse(
      message: map["message"],
    );
  }
}
