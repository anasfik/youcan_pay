import '../../base/youcan_pay_module.dart';

final class YouCanPayCurrencies extends YouCanPayModule {
  static final YouCanPayCurrencies _instance = YouCanPayCurrencies._();
  static YouCanPayCurrencies get instance => _instance;
  YouCanPayCurrencies._();

  @override
  Type get type => runtimeType;
}
