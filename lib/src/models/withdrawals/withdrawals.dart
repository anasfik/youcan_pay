import 'package:youcan_pay/src/models/model.dart';
import 'package:youcan_pay/src/models/withdrawals/withdrawal.dart';

import '../transfers/transfers.dart';

class YouCanPayWithdrawalsPagination extends YouCanPayDataModel {
  final List<YouCanPayWithdrawal> data;
  final YouCanPayPaginationMetadata metadata;

  YouCanPayWithdrawalsPagination({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object?> get props => [data, metadata];

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
