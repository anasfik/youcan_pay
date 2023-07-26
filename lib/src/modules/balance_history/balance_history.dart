import 'package:youcan_pay/src/base/youcan_pay_balance_history_base.dart';
import 'package:youcan_pay/src/utils/enums.dart';

import '../../base/youcan_pay_module.dart';
import '../../models/balance_history/balence_history.dart';
import '../../networking/client.dart';
import '../../networking/endpoint.dart';
import '../../networking/headers.dart';
import '../../utils/consts.dart';

final class YouCanPayBalanceHistory
    implements YouCanPayModule, YouCanPayBalanceHistoryBase {
  static final YouCanPayBalanceHistory _instance = YouCanPayBalanceHistory._();
  static YouCanPayBalanceHistory get instance => _instance;

  YouCanPayBalanceHistory._();

  @override
  Type get type => runtimeType;

  @override
  Future<YouCanPayBalanceHistoryPagination> history({
    required String token,
    YouCanPayBalanceHistorySortField? sortField,
    YouCanPaySortOrder? sortOrder,
    int? limit,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<
        YouCanPayBalanceHistoryPagination>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.balanceHistory,
        "?sort_field=${sortField?.name}",
        "&sort_order=${sortOrder?.name}",
      ]),
      body: {},
      method: YouCanPayNetworkingClientMethod.get,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return YouCanPayBalanceHistoryPagination.fromMap(map);
      },
    );
  }
}
