import '../model.dart';

/// {@template invoice}
/// Represents the response returned by the invoice API endpoint.
/// {@endtemplate}
class YouCanPayInvoice extends YouCanPayDataModel {
  /// The unique identifier of the invoice.
  final String id;

  /// The reference of the invoice.
  final String reference;

  /// The name of the invoice.
  final String name;

  /// The amount of the invoice.
  final String displayAmount;

  /// The status of the invoice.
  final int status;

  /// The status of the invoice.
  final bool isActive;

  /// The description of the invoice.
  final String? description;

  /// The due by date of the invoice.
  final String? dueBy;

  /// The unique identifier of the account.
  final String accountId;

  /// The alias of the account.
  final String? alias;

  ///  Creates a new instance of the [YouCanPayInvoice] class.
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

  /// Creates a new instance of the [YouCanPayInvoice] class from a JSON [map].
  factory YouCanPayInvoice.fromMap(Map<String, dynamic> map) {
    return YouCanPayInvoice(
      id: map['id'] as String,
      reference: map['reference'] as String,
      name: map['name'] as String,
      displayAmount: map['display_amount'] as String,
      status: map['status'] as int,
      isActive: map['is_active'] as bool,
      description: map['description'] as String?,
      dueBy: map['due_by'] as String?,
      accountId: map['account_id'] as String,
      alias: map['alias'] as String?,
    );
  }
}
