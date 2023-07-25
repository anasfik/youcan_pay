import 'package:youcan_pay/src/base/youcan_pay_deposits_base.dart';
import 'package:youcan_pay/src/models/deposits/deposite.dart';

import '../../base/youcan_pay_module.dart';

final class YouCanPayDeposits
    implements YouCanPayModule, YouCanPayDepositsBase {
  static final YouCanPayDeposits _instance = YouCanPayDeposits._();
  static YouCanPayDeposits get instance => _instance;
  YouCanPayDeposits._();

  @override
  Type get type => runtimeType;

  @override
  Future<DepositResponse> tokenize({
    required String token,
    required int amount,
    required String currency,
  }) {
    // TODO: implement tokenize
    throw UnimplementedError();
  }

  @override
  // TODO: implement endpoints
  List<String> get endpoints => throw UnimplementedError();
}
