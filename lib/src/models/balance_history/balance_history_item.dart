import '../youcan_model.dart';

/// {@template balance_history_item}
///  Represents the response returned by the balance history API endpoint.
/// {@endtemplate}
class YouCanPayBlanceHistoryItem extends YouCanPayDataModel {
  /// The unique identifier of the balance history item.
  final String id;

  /// The unique identifier of the account.
  final String accountId;

  /// The amount of the balance history item.
  final String displayAmount;

  /// The type of the causer.
  final int causerType;

  /// The unique identifier of the causer.
  final String causerId;

  /// The type of the causer as text.
  final String causerTypeText;

  ///  Creates a new instance of the [YouCanPayBlanceHistoryItem] class.
  ///
  /// {@macro balance_history_item}
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

  /// Creates a new instance of the [YouCanPayBlanceHistoryItem] class from a JSON [map].
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
