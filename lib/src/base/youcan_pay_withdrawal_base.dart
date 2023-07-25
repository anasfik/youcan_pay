import 'package:youcan_pay/src/models/withdrawals/withdrawal_response.dart';

import '../utils/enums.dart';

abstract interface class YouCanPayWithdrawalBase {
  Future<WithdrawalResponse> create({
    required String paymentMethod,
    required int amount,
    required String withdrawalBankAccountId,
  });

  Future withdrawals({
    required YouCanPayWithdrawalSortField sortField,
    required YouCanPaySortOrder sortOrder,
    required int limit,
  });
}
