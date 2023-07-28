import '../youcan_model.dart';

/// {@template register_response}
/// A model class representing the response of a registration request.
/// {@endtemplate}
class RegisterResponse extends YouCanPayDataModel {
  /// The message returned by the registration request.
  final String message;

  /// {@macro register_response}
  RegisterResponse({
    required this.message,
  });

  /// Creates a new instance of [RegisterResponse] from a [Map].
  ///
  /// Returns `null` if the map is `null`.
  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      message: map["message"],
    );
  }

  @override
  List<Object?> get props => [message];
}
