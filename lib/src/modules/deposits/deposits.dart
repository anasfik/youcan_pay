import '../../base/youcan_pay_module.dart';

final class YouCanPayDeposits implements YouCanPayModule {
  static final YouCanPayDeposits _instance = YouCanPayDeposits._();
  static YouCanPayDeposits get instance => _instance;
  YouCanPayDeposits._();

  @override
  Type get type => runtimeType;
}
