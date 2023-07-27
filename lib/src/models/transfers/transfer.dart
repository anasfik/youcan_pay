import 'package:youcan_pay/src/models/transfers/transceiver.dart';

import '../model.dart';

/// {@template transfer}
///  Represents the response returned by the transfer API endpoint.
/// {@endtemplate}
class YouCanPayTransfer extends YouCanPayDataModel {
  /// The unique identifier of the transfer.
  final String id;

  /// The amount of the transfer.
  final String displayAmount;

  /// The message of the transfer.
  final String message;

  /// Whether the transfer is incoming or not.
  final bool isIncoming;

  /// The date and time the transfer was created.
  final DateTime createdAt;

  /// The transceiver of the transfer.
  final YouCanPayTransceiver transceiver;

  ///  Creates a new instance of the [YouCanPayTransfer] class.
  ///
  /// {@macro transfer}
  YouCanPayTransfer({
    required this.id,
    required this.displayAmount,
    required this.message,
    required this.isIncoming,
    required this.createdAt,
    required this.transceiver,
  });

  @override
  List<Object?> get props => [
        id,
        displayAmount,
        message,
        isIncoming,
        createdAt,
        transceiver,
      ];

  /// Creates a new instance of the [YouCanPayTransfer] class from a JSON [map].
  factory YouCanPayTransfer.fromMap(Map<String, dynamic> map) {
    return YouCanPayTransfer(
      id: map['id'] as String,
      displayAmount: map['display_amount'] as String,
      message: map['message'] as String,
      isIncoming: map['is_incoming'] as bool,
      createdAt: DateTime.parse(map['created_at'] as String),
      transceiver: YouCanPayTransceiver.fromMap(
          map['transceiver']['data'] as Map<String, dynamic>),
    );
  }
}
