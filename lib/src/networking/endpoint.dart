import 'package:youcan_pay/src/youcan_pay.dart';

class YouCanPayEndpointBuilder {
  String call(List<String> endpoints) {
    final baseUrl = YouCanPay.instance.baseUrl;
    _ensureTahatAllEndpointsIncludesSlash(endpoints);

    return [baseUrl, ...endpoints].join("");
  }

  void _ensureTahatAllEndpointsIncludesSlash(List<String> endpointsList) {
    // ! This list is passed by reference, so calling this will modify the original one.
    endpointsList = endpointsList
        .map((endpoint) => endpoint.startsWith("/") ? endpoint : "/$endpoint")
        .toList();
  }
}
