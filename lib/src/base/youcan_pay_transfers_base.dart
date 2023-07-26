import '../models/transfers/transfer.dart';
import '../utils/enums.dart';

abstract interface class YouCanPayTransfersBase {
  Future<YouCanPayTransfer> create({
    required String token,
    required int amount,
    required String identifier,
    String? message,
  });

  Future transfers({
    required String token,
    YouCanPayTransfersSortField? sortField,
    YouCanPaySortOrder? sortOrder,
    int? limit,

    /// TODO: add filters field.
  });
}
