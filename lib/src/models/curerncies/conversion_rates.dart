import 'package:youcan_pay/src/models/model.dart';

class ConversionRatesResponse extends YouCanPayDataModel {
  final String baseCurrency;
  final Map<String, dynamic> conversionRates;

  ConversionRatesResponse({
    required this.baseCurrency,
    required this.conversionRates,
  });

  @override
  List<Object?> get props => [baseCurrency, conversionRates];

  @override
  factory ConversionRatesResponse.fromMap(Map<String, dynamic> map) {
    return ConversionRatesResponse(
      baseCurrency: map["base_currency"] as String,
      conversionRates: map["conversion_rates"] as Map<String, dynamic>,
    );
  }
}
