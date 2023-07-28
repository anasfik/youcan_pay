import '../youcan_model.dart';

class YouCanPayTransceiver extends YouCanPayDataModel {
  /// The unique identifier of the transceiver.
  final String? id;

  /// The first name of the transceiver.
  final String? firstName;

  /// The last name of the transceiver.
  final String? lastName;

  /// The phone number of the transceiver.
  final String? phone;

  /// The email of the transceiver.
  final String? email;

  /// The type of the transceiver.
  final int? type;

  /// The type of the transceiver as text.
  final String? typeText;

  ///  Creates a new instance of the [YouCanPayTransceiver] class.
  YouCanPayTransceiver({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.type,
    required this.typeText,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        phone,
        email,
        type,
        typeText,
      ];

  /// Creates a new instance of the [YouCanPayTransceiver] class from a JSON [map].
  factory YouCanPayTransceiver.fromMap(Map<String, dynamic> map) {
    return YouCanPayTransceiver(
      id: map['id'] as String?,
      firstName: map['first_name'] as String?,
      lastName: map['last_name'] as String?,
      phone: map['phone'] as String?,
      email: map['email'] as String?,
      type: map['type'] as int?,
      typeText: map['type_text'] as String?,
    );
  }
}
