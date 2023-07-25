import '../../base/youcan_pay_currencies_base.dart';
import '../../base/youcan_pay_module.dart';

final class YouCanPayCurrencies
    implements YouCanPayModule, YouCanPayCurrenciesBase {
  static final YouCanPayCurrencies _instance = YouCanPayCurrencies._();
  static YouCanPayCurrencies get instance => _instance;
  YouCanPayCurrencies._();

  @override
  Type get type => runtimeType;

  @override
  Future conversionRates({required String token}) {
    // TODO: implement conversionRates
    throw UnimplementedError();
  }
}
