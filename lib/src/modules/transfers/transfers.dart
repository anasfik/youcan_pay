import 'package:youcan_pay/src/base/youcan_pay_module.dart';

final class YouCanPayTransfers implements YouCanPayModule {
  static final YouCanPayTransfers _instance = YouCanPayTransfers._();
  static YouCanPayTransfers get instance => _instance;
  YouCanPayTransfers._();

  @override
  Type get type => runtimeType;
}
