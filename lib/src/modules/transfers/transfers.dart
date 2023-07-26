import 'package:youcan_pay/src/base/youcan_pay_module.dart';
import 'package:youcan_pay/src/base/youcan_pay_transfers_base.dart';
import 'package:youcan_pay/src/models/transfers/transfer.dart';
import 'package:youcan_pay/src/networking/client.dart';
import 'package:youcan_pay/src/networking/endpoint.dart';
import 'package:youcan_pay/src/networking/headers.dart';
import 'package:youcan_pay/src/utils/consts.dart';
import 'package:youcan_pay/src/utils/enums.dart';

final class YouCanPayTransfers
    implements YouCanPayModule, YouCanPayTransfersBase {
  static final YouCanPayTransfers _instance = YouCanPayTransfers._();
  static YouCanPayTransfers get instance => _instance;
  YouCanPayTransfers._();

  @override
  Type get type => runtimeType;

  @override
  Future<YouCanPayTransfer> create({
    required String token,
    required int amount,
    required String identifier,
    String? message,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson(
      endpoint:
          YouCanPayEndpointBuilder()([YouCanPayConstants.endpoints.transfers]),
      body: {
        'amount': amount,
        'identifier': identifier,
        if (message != null) 'message': message,
      },
      method: YouCanPayNetworkingClientMethod.post,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return YouCanPayTransfer.fromMap(map);
      },
    );
  }

  @override
  Future transfers({
    required String token,
    required YouCanPayTransfersSortField sortField,
    required YouCanPaySortOrder sortOrder,
    required int limit,
  }) {
    // TODO: implement transfers
    throw UnimplementedError();
  }
}
