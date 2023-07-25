import 'package:youcan_pay/src/base/youcan_pay_module.dart';
import 'package:youcan_pay/src/base/youcan_pay_withdrawal_base.dart';
import 'package:youcan_pay/src/models/withdrawals/withdrawal_response.dart';
import 'package:youcan_pay/src/utils/enums.dart';

final class YouCanPayWithdrawals
    implements YouCanPayModule, YouCanPayWithdrawalBase {
  static final YouCanPayWithdrawals _instance = YouCanPayWithdrawals._();
  static YouCanPayWithdrawals get instance => _instance;
  YouCanPayWithdrawals._();

  @override
  Type get type => runtimeType;

  @override
  Future<WithdrawalResponse> create({
    required String token,
    required String paymentMethod,
    required int amount,
    required String withdrawalBankAccountId,
  }) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future withdrawals({
    required String token,
    required YouCanPayWithdrawalSortField sortField,
    required YouCanPaySortOrder sortOrder,
    required int limit,
  }) {
    // TODO: implement withdrawals
    throw UnimplementedError();
  }

  @override
  // TODO: implement endpoints
  List<String> get endpoints => throw UnimplementedError();
}
