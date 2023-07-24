import 'package:youcan_pay/src/base/youcan_pay_module.dart';

final class YouCanPayWithdrawals implements YouCanPayModule {
  static final YouCanPayWithdrawals _instance = YouCanPayWithdrawals._();
  static YouCanPayWithdrawals get instance => _instance;
  YouCanPayWithdrawals._();

  @override
  Type get type => runtimeType;
}
