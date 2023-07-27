import 'package:youcan_pay/src/models/invoices/invoice.dart';

import 'package:youcan_pay/src/models/model.dart';

import '../transfers/transfers.dart';

/// {@template invoices_pagination}
/// Represents the response returned by the invoices API endpoint.
/// {@endtemplate}
class YouCanPayInvoicesPagination extends YouCanPayDataModel {
  /// The list of invoices.
  final List<YouCanPayInvoice> data;

  /// The pagination metadata.
  final YouCanPayPaginationMetadata metadata;

  ///  Creates a new instance of the [YouCanPayInvoicesPagination] class.
  ///
  /// {@macro invoices_pagination}
  YouCanPayInvoicesPagination({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object?> get props => [data, metadata];

  /// Creates a new instance of the [YouCanPayInvoicesPagination] class from a JSON [map].
  factory YouCanPayInvoicesPagination.fromMap(Map<String, dynamic> map) {
    return YouCanPayInvoicesPagination(
      data: List<YouCanPayInvoice>.from(
        (map['data'] as List).map(
          (x) => YouCanPayInvoice.fromMap(x),
        ),
      ),
      metadata: YouCanPayPaginationMetadata.fromMap(
        map['meta']['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}
