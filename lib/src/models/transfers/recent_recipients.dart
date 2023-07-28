import 'package:equatable/equatable.dart';
import 'package:youcan_pay/src/models/youcan_model.dart';

/// {@template recent_recipients}
///  Represents the response returned by the recent recipients API endpoint.
/// {@endtemplate}
class YouCanPayRecentRecipients extends YouCanPayDataModel {
  /// The list of recent recipients.
  final List<YouCanPayRecentRecipient> data;

  ///  Creates a new instance of the [YouCanPayRecentRecipients] class.
  ///
  /// {@macro recent_recipients}
  YouCanPayRecentRecipients({
    required this.data,
  });

  @override
  List<Object?> get props => [data];

  /// Creates a new instance of the [YouCanPayRecentRecipients] class from a JSON [map].
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

/// {@template recent_recipient}
///  Represents the response returned by the recent recipient API endpoint.
/// {@endtemplate}
class YouCanPayRecentRecipient extends Equatable {
  /// The id of the recent recipient.
  final String id;

  /// The first name of the recent recipient.
  final String firstName;

  /// The last name of the recent recipient.
  final String lastName;

  /// The phone number of the recent recipient.
  final String phone;

  /// The email of the recent recipient.
  final String email;

  ///  Creates a new instance of the [YouCanPayRecentRecipient] class.
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

  /// Creates a new instance of the [YouCanPayRecentRecipient] class from a JSON [map].
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
