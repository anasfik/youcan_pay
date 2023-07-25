import '../models/payments/cash_plus.dart';
import '../models/payments/pay.dart';
import '../models/payments/tokize_response.dart';

abstract interface class YouCanPayPaymentsBase {
  Future<TokenizeResponse> tokenize({
    required int amount,
    required String priKey,
    required String currency,
    required String orderId,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? customer,
  });

  Future<CashPlusResponse> cashPlusInit({
    required String pubKey,
    required String tokenId,
  });

  Future<PayResponse> pay({
    required String pubKey,
    required String tokenId,
    required String creditCard,
    required String cardHolderName,
    required String cvv,
    required DateTime expiryDate,
  });

  Future<PayResponse> authorize({
    required String pubKey,
    required String tokenId,
    required String creditCard,
    required String cardHolderName,
    required String cvv,
    required DateTime expiryDate,
  });
}