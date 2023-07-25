
import '../model.dart';

class YouCanPayInvoice extends YouCanPayDataModel {
  final String id;
  final String reference;
  final String name;
  final String displayAmount;
  final int status;
  final bool isActive;
  final String description;
  final String? dueBy;
  final String accountId;
  final String alias;

  YouCanPayInvoice({
    required this.id,
    required this.reference,
    required this.name,
    required this.displayAmount,
    required this.status,
    required this.isActive,
    required this.description,
    required this.dueBy,
    required this.accountId,
    required this.alias,
  });

  @override
  List<Object?> get props => [
        id,
        reference,
        name,
        displayAmount,
        status,
        isActive,
        description,
        dueBy,
        accountId,
        alias,
      ];

  factory YouCanPayInvoice.fromMap(Map<String, dynamic> map) {
    return YouCanPayInvoice(
      id: map['id'] as String,
      reference: map['reference'] as String,
      name: map['name'] as String,
      displayAmount: map['display_amount'] as String,
      status: map['status'] as int,
      isActive: map['is_active'] as bool,
      description: map['description'] as String,
      dueBy: map['due_by'] as String?,
      accountId: map['account_id'] as String,
      alias: map['alias'] as String,
    );
  }
}
