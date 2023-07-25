import '../../base/youcan_pay_module.dart';

final class YouCanPayBalanceHistory implements YouCanPayModule {
  static final YouCanPayBalanceHistory _instance = YouCanPayBalanceHistory._();
  static YouCanPayBalanceHistory get instance => _instance;
  YouCanPayBalanceHistory._();

  @override
  Type get type => runtimeType;
}
