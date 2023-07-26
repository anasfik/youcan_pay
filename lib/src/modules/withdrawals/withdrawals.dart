import 'package:youcan_pay/src/base/youcan_pay_module.dart';
import 'package:youcan_pay/src/base/youcan_pay_withdrawal_base.dart';
import 'package:youcan_pay/src/models/withdrawals/withdrawal_response.dart';
import 'package:youcan_pay/src/utils/enums.dart';

import '../../models/withdrawals/withdrawals.dart';
import '../../networking/client.dart';
import '../../networking/endpoint.dart';
import '../../networking/headers.dart';
import '../../utils/consts.dart';

final class YouCanPayWithdrawals
    implements YouCanPayModule, YouCanPayWithdrawalBase {
  static final YouCanPayWithdrawals _instance = YouCanPayWithdrawals._();
  static YouCanPayWithdrawals get instance => _instance;
  YouCanPayWithdrawals._();

  @override
  Type get type => runtimeType;

  @override
  Future<WithdrawalResponse> create({
    required String token,
    required YouCanPayPaymentsMethod paymentMethod,
    required int amount,
    String? withdrawalBankAccountId,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.withdrawals,
      ]),
      body: {
        "payment_method": paymentMethod.name,
        "amount": amount,
        if (withdrawalBankAccountId != null)
          "withdrawal_bank_account_id": withdrawalBankAccountId,
      },
      method: YouCanPayNetworkingClientMethod.post,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return WithdrawalResponse.fromMap(map['data']);
      },
    );
  }

  @override
  Future<YouCanPayWithdrawalsPagination> withdrawals({
    required String token,
    YouCanPayWithdrawalSortField? sortField,
    YouCanPaySortOrder? sortOrder,
    int? limit,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<
        YouCanPayWithdrawalsPagination>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.withdrawals,
        "?sort_field=${sortField?.name}",
        "&sort_order=${sortOrder?.name}",
      ]),
      body: {},
      method: YouCanPayNetworkingClientMethod.get,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return YouCanPayWithdrawalsPagination.fromMap(map);
      },
    );
  }
}
