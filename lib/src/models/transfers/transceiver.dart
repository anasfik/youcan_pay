
import '../model.dart';

class YouCanPayTransceiver extends YouCanPayDataModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final int type;
  final String typeText;

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

  factory YouCanPayTransceiver.fromMap(Map<String, dynamic> map) {
    return YouCanPayTransceiver(
      id: map['id'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      type: map['type'] as int,
      typeText: map['type_text'] as String,
    );
  }
}
