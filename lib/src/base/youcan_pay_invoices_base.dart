import '../utils/enums.dart';

abstract interface class YouCanPayInvoices {
  /// TODO; figure out how exactly those APIs are working from the docs.

  Future create({
    required String reference,
    required String name,
    required int amount,
    required String currency,
    required int contactOption,
    required String description,
    required String to,
    required bool active,
    required String content,
  });

  Future invoices({
    required String token,
    required YouCanPayInvoicesSortField sortField,
    required YouCanPaySortOrder sortOrder,
    required int limit,

    /// TODO: add filters field.
  });
}
