import 'package:equatable/equatable.dart';
import 'package:youcan_pay/src/models/model.dart';

class YouCanPayRecentRecipients extends YouCanPayDataModel {
  final List<YouCanPayRecentRecipient> data;

  YouCanPayRecentRecipients({
    required this.data,
  });

  @override
  List<Object?> get props => [data];

  factory YouCanPayRecentRecipients.fromMap(Map<String, dynamic> map) {
    return YouCanPayRecentRecipients(
      data: List<YouCanPayRecentRecipient>.from(
        map["data"].map(
          (x) => YouCanPayRecentRecipient.fromMap(x),
        ),
      ),
    );
  }
}

class YouCanPayRecentRecipient extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  YouCanPayRecentRecipient({
    required this.id,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.lastName,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        phone,
        email,
      ];

  factory YouCanPayRecentRecipient.fromMap(Map<String, dynamic> map) {
    return YouCanPayRecentRecipient(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
      email: map['email'],
    );
  }
}
