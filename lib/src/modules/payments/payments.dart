import '../../base/youcan_pay_module.dart';

final class YouCanPayPayments extends YouCanPayModule {
  static final YouCanPayPayments _instance = YouCanPayPayments._();
  static YouCanPayPayments get instance => _instance;
  YouCanPayPayments._();

  @override
  Type get type => runtimeType;
}
