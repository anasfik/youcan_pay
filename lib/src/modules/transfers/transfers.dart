import 'package:youcan_pay/src/base/youcan_pay_module.dart';

final class YouCanPayTransfers extends YouCanPayModule {
  static final YouCanPayTransfers _instance = YouCanPayTransfers._();
  static YouCanPayTransfers get instance => _instance;
  YouCanPayTransfers._();

  @override
  Type get type => runtimeType;
}
