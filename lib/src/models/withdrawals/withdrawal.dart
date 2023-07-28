import '../youcan_model.dart';

/// {@template withdrawal}
/// Represents the response returned by the withdrawal API endpoint.
/// {@endtemplate}
class YouCanPayWithdrawal extends YouCanPayDataModel {
  /// The unique identifier of the withdrawal.
  final String id;

  /// The amount of the withdrawal.
  final String amount;

  /// The currency of the withdrawal.
  final String currency;

  /// The status of the withdrawal.
  final int status;

  /// The status of the withdrawal.
  final String statusName;

  /// The unique identifier of the provider.
  final int providerId;

  /// The name of the provider.
  final String providerName;

  /// The date of the withdrawal.
  final DateTime? paidAt;

  /// The date and time the withdrawal was created.
  final DateTime createdAt;

  /// Creates a new instance of the [Withdrawal] class.
  YouCanPayWithdrawal({
    required this.id,
    required this.amount,
    required this.currency,
    required this.status,
    required this.statusName,
    required this.providerId,
    required this.providerName,
    required this.paidAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        amount,
        currency,
        status,
        statusName,
        providerId,
        providerName,
        paidAt,
        createdAt,
      ];

  /// Creates a new instance of the [Withdrawal] class from a JSON [map].
  factory YouCanPayWithdrawal.fromMap(Map<String, dynamic> map) {
    return YouCanPayWithdrawal(
      id: map['id'] as String,
      amount: map['display_amount']['amount'] as String,
      currency: map['display_amount']['currency'] as String,
      status: map['status'] as int,
      statusName: map['status_name'] as String,
      providerId: map['provider_id'] as int,
      providerName: map['provider_name'] as String,
      paidAt: map['paid_at'] != null ? DateTime.parse(map['paid_at']) : null,
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
