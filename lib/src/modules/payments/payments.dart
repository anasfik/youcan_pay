import 'package:youcan_pay/src/models/payments/cash_plus.dart';
import 'package:youcan_pay/src/models/payments/pay.dart';
import 'package:youcan_pay/src/models/payments/tokize_response.dart';

import '../../base/youcan_pay_module.dart';
import '../../base/youcan_pay_payments_base.dart';

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
    throw UnimplementedError();
  }

  @override
  Future<PayResponse> authorize({
    required String pubKey,
    required String tokenId,
    required String creditCard,
    required String cardHolderName,
    required String cvv,
    required DateTime expiryDate,
  }) {
    // TODO: implement authorize
    throw UnimplementedError();
  }

  @override
  Future<CashPlusResponse> cashPlusInit({
    required String pubKey,
    required String tokenId,
  }) {
    // TODO: implement cashPlusInit
    throw UnimplementedError();
  }

  @override
  Future<PayResponse> pay({
    required String pubKey,
    required String tokenId,
    required String creditCard,
    required String cardHolderName,
    required String cvv,
    required DateTime expiryDate,
  }) {
    // TODO: implement pay
    throw UnimplementedError();
  }
}
