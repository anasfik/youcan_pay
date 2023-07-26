import '../models/invoices/invoice.dart';
import '../models/invoices/invoices.dart';
import '../utils/enums.dart';

abstract interface class YouCanPayInvoicesBase {
  Future<YouCanPayInvoice> create({
    String? reference,
    required String token,
    required String name,
    required int amount,
    required String currency,
    required int contactOption,
    String? description,
    String? to,
    int? active,
    String? content,
  });

  Future<YouCanPayInvoicesPagination> invoices({
    required String token,
    YouCanPayInvoicesSortField? sortField,
    YouCanPaySortOrder? sortOrder,
    int? limit,

    /// TODO: add filters field.
  });
}
