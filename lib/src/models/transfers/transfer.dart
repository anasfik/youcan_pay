import 'package:equatable/equatable.dart';
import 'package:youcan_pay/src/models/transfers/transceiver.dart';

class YouCanPayTransfer extends Equatable {
  final String id;
  final String displayAmount;
  final String message;
  final bool isIncoming;
  final DateTime createdAt;
  final YouCanPayTransceiver transceiver;

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
