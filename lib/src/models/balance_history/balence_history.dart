import 'package:equatable/equatable.dart';
import 'package:youcan_pay/src/models/balance_history/balance_history_item.dart';
import 'package:youcan_pay/src/models/invoices/invoice.dart';

import 'package:youcan_pay/src/models/model.dart';
import 'package:youcan_pay/src/models/transfers/transfer.dart';

import '../transfers/transfers.dart';

class YouCanPayBalanceHistoryPagination extends YouCanPayDataModel {
  final List<YouCanPayBlanceHistoryItem> data;
  final YouCanPayPaginationMetadata metadata;

  YouCanPayBalanceHistoryPagination({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object?> get props => [data, metadata];

  factory YouCanPayBalanceHistoryPagination.fromMap(Map<String, dynamic> map) {
    return YouCanPayBalanceHistoryPagination(
      data: List<YouCanPayBlanceHistoryItem>.from(
        (map['data'] as List).map(
          (x) => YouCanPayBlanceHistoryItem.fromMap(x),
        ),
      ),
      metadata: YouCanPayPaginationMetadata.fromMap(
        map['meta']['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}
