import '../model.dart';

class YouCanPayWithdrawal extends YouCanPayDataModel {
  final String id;
  final String amount;
  final String currency;
  final int status;
  final String statusName;
  final int providerId;
  final String providerName;
  final String? paidAt;
  final String createdAt;

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

  factory YouCanPayWithdrawal.fromMap(Map<String, dynamic> map) {
    return YouCanPayWithdrawal(
      id: map['id'] as String,
      amount: map['display_amount']['amount'] as String,
      currency: map['display_amount']['currency'] as String,
      status: map['status'] as int,
      statusName: map['status_name'] as String,
      providerId: map['provider_id'] as int,
      providerName: map['provider_name'] as String,
      paidAt: map['paid_at'] as String?,
      createdAt: map['created_at'] as String,
    );
  }
}
