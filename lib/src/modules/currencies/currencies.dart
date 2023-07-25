import '../../base/youcan_pay_currencies_base.dart';
import '../../base/youcan_pay_module.dart';
import '../../models/curerncies/conversion_rates.dart';
import '../../networking/client.dart';
import '../../networking/endpoint.dart';
import '../../networking/headers.dart';
import '../../utils/consts.dart';
import '../../utils/enums.dart';

final class YouCanPayCurrencies
    implements YouCanPayModule, YouCanPayCurrenciesBase {
  static final YouCanPayCurrencies _instance = YouCanPayCurrencies._();
  static YouCanPayCurrencies get instance => _instance;
  YouCanPayCurrencies._();

  @override
  Type get type => runtimeType;

  @override
  Future<ConversionRatesResponse> conversionRates({required String token}) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<
        ConversionRatesResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.currency,
        YouCanPayConstants.endpoints.conversionRates,
      ]),
      body: {
        'token': token,
      },
      method: YouCanPayNetworkingClientMethod.get,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return ConversionRatesResponse.fromMap(map);
      },
    );
  }
}
