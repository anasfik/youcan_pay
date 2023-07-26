import 'package:equatable/equatable.dart';
import 'package:youcan_pay/src/models/invoices/invoice.dart';

import 'package:youcan_pay/src/models/model.dart';
import 'package:youcan_pay/src/models/transfers/transfer.dart';

import '../transfers/transfers.dart';

class YouCanPayInvoicesPagination extends YouCanPayDataModel {
  final List<YouCanPayInvoice> data;
  final YouCanPayPaginationMetadata metadata;

  YouCanPayInvoicesPagination({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object?> get props => [data, metadata];

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
