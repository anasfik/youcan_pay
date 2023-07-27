import 'package:youcan_pay/src/youcan_pay.dart';

import '../utils/consts.dart';

class YouCanPayEndpointBuilder {
  String call(List<String> endpoints) {
    final baseUrl = YouCanPayConstants.baseUrl;
    final sandboxBaseUrl = YouCanPayConstants.sandboxBaseUrl;

    _ensureTahatAllEndpointsIncludesSlash(endpoints);

    final isSandbox = YouCanPay.instance.isSandbox;

    final sandBoxModeEndpoints = [
      YouCanPayConstants.endpoints.apiTokenize,
      YouCanPayConstants.endpoints.authorize,
      YouCanPayConstants.endpoints.cashplus,
      "/${YouCanPayConstants.endpoints.pay}",
    ];

    final liveModeFullEnpointUrl = [baseUrl, ...endpoints].join("");
    if (isSandbox) {
      for (int index = 0; index < sandBoxModeEndpoints.length; index++) {
        final current = sandBoxModeEndpoints[index];
        if (liveModeFullEnpointUrl.contains(current)) {
          return [sandboxBaseUrl, ...endpoints].join("");
        }
      }
    }

    return liveModeFullEnpointUrl;
  }

  void _ensureTahatAllEndpointsIncludesSlash(List<String> endpointsList) {
    // ! This list is passed by reference, so calling this will modify the original one.

    for (int index = 0; index < endpointsList.length; index++) {
      bool isEndpointWithoutSlash = !endpointsList[index].startsWith("/");
      bool isQuery = endpointsList[index].startsWith("?") ||
          endpointsList[index].startsWith("&");

      if (isEndpointWithoutSlash && !isQuery) {
        endpointsList[index] = "/${endpointsList[index]}";
      }
    }
  }
}
