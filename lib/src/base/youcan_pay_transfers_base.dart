import '../models/transfers/transfer.dart';
import '../utils/enums.dart';

abstract interface class YouCanPayTransfersBase {
  Future<YouCanPayTransfer> create({
    required String token,
    required int amount,
    required String identifier,
    required String message,
  });

  Future transfers({
    required String token,
    required YouCanPayTransfersSortField sortField,
    required YouCanPaySortOrder sortOrder,
    required int limit,

    /// TODO: add filters field.
  });
}
