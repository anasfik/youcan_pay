import '../../base/youcan_pay_module.dart';

final class YouCanPayAccounts implements YouCanPayModule {
  static final YouCanPayAccounts _instance = YouCanPayAccounts._();
  static YouCanPayAccounts get instance => _instance;
  YouCanPayAccounts._();

  @override
  Type get type => runtimeType;
}
