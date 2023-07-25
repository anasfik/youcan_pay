import 'package:equatable/equatable.dart';

class YouCanPayBlanceHistoryItem extends Equatable {
  final String id;
  final String accountId;
  final String displayAmount;
  final int causerType;
  final String causerId;
  final String causerTypeText;

  YouCanPayBlanceHistoryItem({
    required this.id,
    required this.accountId,
    required this.displayAmount,
    required this.causerType,
    required this.causerId,
    required this.causerTypeText,
  });

  @override
  List<Object?> get props => [
        id,
        accountId,
        displayAmount,
        causerType,
        causerId,
        causerTypeText,
      ];

  factory YouCanPayBlanceHistoryItem.fromMap(Map<String, dynamic> map) {
    return YouCanPayBlanceHistoryItem(
      id: map['id'] as String,
      accountId: map['account_id'] as String,
      displayAmount: map['display_amount'] as String,
      causerType: map['causer_type'] as int,
      causerId: map['causer_id'] as String,
      causerTypeText: map['causer_type_text'] as String,
    );
  }
}
