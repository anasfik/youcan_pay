import 'package:youcan_pay/src/models/payments/cash_plus.dart';
import 'package:youcan_pay/src/models/payments/pay.dart';
import 'package:youcan_pay/src/models/payments/tokize_response.dart';
import 'package:youcan_pay/src/networking/client.dart';
import 'package:youcan_pay/src/utils/consts.dart';
import 'package:youcan_pay/src/utils/enums.dart';

import '../../base/youcan_pay_module.dart';
import '../../base/youcan_pay_payments_base.dart';
import '../../models/payments/expiry_date.dart';
import '../../networking/endpoint.dart';

final class YouCanPayPayments
    implements YouCanPayModule, YouCanPayPaymentsBase {
  @override
  List<String> get endpoints => [];

  static final YouCanPayPayments _instance = YouCanPayPayments._();
  static YouCanPayPayments get instance => _instance;
  YouCanPayPayments._();

  @override
  Type get type => runtimeType;

  @override
  Future<TokenizeResponse> tokenize({
    required int amount,
    required String priKey,
    required String currency,
    required String orderId,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? customer,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<TokenizeResponse>(
      endpoint:
          YouCanPayEndpointBuilder()([YouCanPayConstants.endpoints.tokenize]),
      body: {
        "amount": amount,
        "pri_key": priKey,
        "currency": currency,
        "order_id": orderId,
        if (metadata != null) "metadata": metadata,
        if (customer != null) "customer": customer,
      },
      method: YouCanPayNetworkingClientMethod.post,
      onSuccess: (map) {
        return TokenizeResponse.fromMap(map);
      },
    );
  }

  @override
  Future<PayResponse> authorize({
    required String pubKey,
    required String tokenId,
    required int creditCard,
    required String cardHolderName,
    required int cvv,
    required YouCanPayExpireDate expireDate,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<PayResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.authorize,
      ]),
      body: {
        "pub_key": pubKey,
        "token_id": tokenId,
        "credit_card": creditCard,
        "card_holder_name": cardHolderName,
        "cvv": cvv,
        "expire_date": expireDate.toString(),
      },
      method: YouCanPayNetworkingClientMethod.post,
      onSuccess: (map) {
        return PayResponse.fromMap(map);
      },
    );
  }

  @override
  Future<CashPlusResponse> cashPlusInit({
    required String pubKey,
    required String tokenId,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<CashPlusResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.cashplus,
        YouCanPayConstants.endpoints.init,
      ]),
      body: {
        "pub_key": pubKey,
        "token_id": tokenId,
      },
      method: YouCanPayNetworkingClientMethod.post,
      onSuccess: (map) {
        return CashPlusResponse.fromMap(map);
      },
    );
  }

  @override
  Future<PayResponse> pay({
    required String pubKey,
    required String tokenId,
    required int creditCard,
    required String cardHolderName,
    required int cvv,
    required YouCanPayExpireDate expireDate,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<PayResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.pay,
      ]),
      body: {
        "pub_key": pubKey,
        "token_id": tokenId,
        "credit_card": creditCard,
        "card_holder_name": cardHolderName,
        "cvv": cvv,
        "expire_date": expireDate.toString(),
      },
      method: YouCanPayNetworkingClientMethod.post,
      onSuccess: (map) {
        return PayResponse.fromMap(map);
      },
    );
  }
}
