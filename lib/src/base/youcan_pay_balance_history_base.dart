import '../utils/enums.dart';

abstract interface class YouCanPayBalanceHistoryBase {
  Future history({
    required String token,
    required YouCanPayBalanceHistorySortField sortField,
    required YouCanPaySortOrder sortOrder,
    required int limit,
    // TODO: add filters field.
  });
}
