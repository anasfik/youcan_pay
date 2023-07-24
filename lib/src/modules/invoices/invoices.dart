import '../../base/youcan_pay_module.dart';

final class YouCanPayInvoices implements YouCanPayModule {
  static final YouCanPayInvoices _instance = YouCanPayInvoices._();
  static YouCanPayInvoices get instance => _instance;
  YouCanPayInvoices._();

  @override
  Type get type => runtimeType;
}
