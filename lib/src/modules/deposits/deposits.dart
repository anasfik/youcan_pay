import 'package:youcan_pay/src/base/youcan_pay_deposits_base.dart';
import 'package:youcan_pay/src/models/deposits/deposite.dart';

import '../../base/youcan_pay_module.dart';
import '../../networking/client.dart';
import '../../networking/endpoint.dart';
import '../../networking/headers.dart';
import '../../utils/consts.dart';
import '../../utils/enums.dart';

final class YouCanPayDeposits
    implements YouCanPayModule, YouCanPayDepositsBase {
  static final YouCanPayDeposits _instance = YouCanPayDeposits._();
  static YouCanPayDeposits get instance => _instance;
  YouCanPayDeposits._();

  @override
  Type get type => runtimeType;

  @override
  Future<DepositResponse> tokenize({
    required String token,
    required int amount,
    required String currency,
  }) async {
    return YouCanPayNetworkingClient.sendFormRequestFromJson(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.deposits,
        YouCanPayConstants.endpoints.tokenize,
      ]),
      body: {
        'amount': amount,
        'currency': currency,
      },
      method: YouCanPayNetworkingClientMethod.post,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return DepositResponse.fromMap(map);
      },
    );
  }
}
