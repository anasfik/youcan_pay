import 'package:youcan_pay/src/models/balance_history/balance_history_item.dart';

import 'package:youcan_pay/src/models/youcan_model.dart';

import '../transfers/transfers.dart';

/// {@template balance_history_pagination}
///  Represents the response returned by the balance history API endpoint.
/// {@endtemplate}
class YouCanPayBalanceHistoryPagination extends YouCanPayDataModel {
  /// The list of balance history items.
  final List<YouCanPayBlanceHistoryItem> data;

  /// The pagination metadata.
  final YouCanPayPaginationMetadata metadata;

  ///  Creates a new instance of the [YouCanPayBalanceHistoryPagination] class.
  ///
  /// {@macro balance_history_pagination}
  YouCanPayBalanceHistoryPagination({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object?> get props => [data, metadata];

  /// Creates a new instance of the [YouCanPayBalanceHistoryPagination] class from a JSON [map].
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
