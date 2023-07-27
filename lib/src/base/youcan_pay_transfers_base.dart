import '../models/transfers/recent_recipients.dart';
import '../models/transfers/transfer.dart';
import '../models/transfers/transfers.dart';
import '../utils/enums.dart';

abstract interface class YouCanPayTransfersBase {
  Future<YouCanPayTransfer> create({
    required String token,
    required int amount,
    required String identifier,
    String? message,
  });

  Future<YouCanPayTransfersPagination> transfers({
    required String token,
    YouCanPayTransfersSortField? sortField,
    YouCanPaySortOrder? sortOrder,
    int? limit,

    /// TODO: add filters field.
  });

  Future<YouCanPayRecentRecipients> recentRecipients({
    required String token,
  });
}
