import 'package:youcan_pay/src/models/model.dart';

/// {@template conversion_rates_response}
///  Represents the response returned by the conversion rates API endpoint.
/// {@endtemplate}
class ConversionRatesResponse extends YouCanPayDataModel {
  /// The base currency of the conversion rates.
  final String baseCurrency;

  /// The conversion rates.
  final Map<String, dynamic> conversionRates;

  ///  Creates a new instance of the [ConversionRatesResponse] class.
  ///
  /// {@macro conversion_rates_response}
  ConversionRatesResponse({
    required this.baseCurrency,
    required this.conversionRates,
  });

  @override
  List<Object?> get props => [baseCurrency, conversionRates];

  /// Creates a new instance of the [ConversionRatesResponse] class from a JSON [map].
  @override
  factory ConversionRatesResponse.fromMap(Map<String, dynamic> map) {
    return ConversionRatesResponse(
      baseCurrency: map["base_currency"] as String,
      conversionRates: map["conversion_rates"] as Map<String, dynamic>,
    );
  }
}
