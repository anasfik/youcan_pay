import 'package:youcan_pay/src/models/youcan_model.dart';
import 'package:youcan_pay/src/models/withdrawals/withdrawal.dart';

import '../transfers/transfers.dart';

/// {@template withdrawals_pagination}
/// Represents the response returned by the withdrawals API endpoint.
/// {@endtemplate}
class YouCanPayWithdrawalsPagination extends YouCanPayDataModel {
  /// The list of withdrawals.
  final List<YouCanPayWithdrawal> data;

  /// The pagination metadata.
  final YouCanPayPaginationMetadata metadata;

  ///  Creates a new instance of the [YouCanPayWithdrawalsPagination] class.
  ///
  /// {@macro withdrawals_pagination}
  YouCanPayWithdrawalsPagination({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object?> get props => [data, metadata];

  /// Creates a new instance of the [YouCanPayWithdrawalsPagination] class from a JSON [map].
  factory YouCanPayWithdrawalsPagination.fromMap(Map<String, dynamic> map) {
    return YouCanPayWithdrawalsPagination(
      data: List<YouCanPayWithdrawal>.from(
        (map['data'] as List).map(
          (x) => YouCanPayWithdrawal.fromMap(x),
        ),
      ),
      metadata: YouCanPayPaginationMetadata.fromMap(
        map['meta']['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}
