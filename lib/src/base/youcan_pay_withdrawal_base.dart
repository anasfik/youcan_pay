import 'package:youcan_pay/src/models/withdrawals/withdrawal_response.dart';

import '../utils/enums.dart';

abstract interface class YouCanPayWithdrawalBase {
  Future<WithdrawalResponse> create({
    required String token,
    required YouCanPayPaymentsMethod paymentMethod,
    required int amount,
    String? withdrawalBankAccountId,
  });

  Future withdrawals({
    required String token,
    YouCanPayWithdrawalSortField? sortField,
    YouCanPaySortOrder? sortOrder,
    int? limit,
  });
}
