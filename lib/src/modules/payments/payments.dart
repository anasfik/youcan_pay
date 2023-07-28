import 'package:youcan_pay/src/models/payments/cash_plus.dart';
import 'package:youcan_pay/src/models/payments/successful_pay.dart';
import 'package:youcan_pay/src/models/payments/tokize_response.dart';
import 'package:youcan_pay/src/networking/client.dart';
import 'package:youcan_pay/src/utils/consts.dart';
import 'package:youcan_pay/src/utils/enums.dart';

import '../../base/youcan_pay_module.dart';
import '../../base/youcan_pay_payments_base.dart';
import '../../models/payments/3ds_pay_response.dart';
import '../../models/payments/expiry_date.dart';
import '../../models/payments/pay_response.dart';
import '../../models/payments/unknown_pay.dart';
import '../../models/payments/unsuccessful_pay.dart';
import '../../networking/endpoint.dart';

final class YouCanPayPayments
    implements YouCanPayModule, YouCanPayPaymentsBase {
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
        // ! the (map["is_success"] == true) is for the condition where it can be (null == true) which is false.
        if (map.containsKey("is_success") && map["is_success"] == true) {
          return SuccessfulPayResponse.fromMap(map);
        } else if (map.containsKey("redirect_url")) {
          return Verification3dsPayResponse.fromMap(map);

          // Please read the previous comment for clarity.
        } else if (map.containsKey("is_success") &&
            map["is_success"] == false) {
          return UnSuccessfulPayResponse.fromMap(map);
        } else {
          return UnknownPayResponse(decodedJsonResponse: map);
        }
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
        // ! the (map["is_success"] == true) is for the condition where it can be (null == true) which is false.
        if (map.containsKey("is_success") && map["is_success"] == true) {
          return SuccessfulPayResponse.fromMap(map);
        } else if (map.containsKey("redirect_url")) {
          return Verification3dsPayResponse.fromMap(map);

          // Please read the previous comment for clarity.
        } else if (map.containsKey("is_success") &&
            map["is_success"] == false) {
          return UnSuccessfulPayResponse.fromMap(map);
        } else {
          return UnknownPayResponse(decodedJsonResponse: map);
        }
      },
    );
  }
}
