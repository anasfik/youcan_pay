import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youcan_pay/src/modules/payments/payments.dart';
import '../base/flutter/flutter.dart';
import '../exceptions/export.dart';
import '../models/export.dart';
import 'models/card.dart';
import 'widget/web_view.dart';

final class YouCanPayFlutter implements YouCanPayFlutterBase {
  static final YouCanPayFlutter _instance = YouCanPayFlutter._();
  static YouCanPayFlutter get instance => _instance;

  YouCanPayFlutter._();

  void processPay(
    BuildContext context, {
    required String paymentToken,
    required String pubKey,
    required YouCanPayCard card,
    void Function(YouCanPayException exception, dynamic stacktrace)?
        onPaymentFailed,
    void Function(SuccessfulPayResponse successfulPayResponse)?
        onPaymentSuccessWithout3dsVerification,
  }) {
    paymentFlowBuilder(
      context,
      paymentToken: paymentToken,
      pubKey: pubKey,
      card: card,
      onPaymentSuccessWithout3dsVerification:
          onPaymentSuccessWithout3dsVerification,
      onPaymentFailed: onPaymentFailed,
      onPaymentRequiring3dsVerification: (verification3dsPayResponse) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Verification3dsWebView(verification3dsPayResponse);
          },
        );
      },
    );
  }

  @override
  void paymentFlowBuilder(
    BuildContext context, {
    required String paymentToken,
    required String pubKey,
    required YouCanPayCard card,
    void Function(YouCanPayException exception, dynamic stacktrace)?
        onPaymentFailed,
    void Function(SuccessfulPayResponse successfulPayResponse)?
        onPaymentSuccessWithout3dsVerification,
    void Function(Verification3dsPayResponse verification3dsPayResponse)?
        onPaymentRequiring3dsVerification,
  }) async {
    try {
      final payResponse = await YouCanPayPayments.instance.pay(
        pubKey: pubKey,
        tokenId: paymentToken,
        creditCard: card.creditCard,
        cardHolderName: card.cardHolderName,
        cvv: card.cvv,
        expireDate: card.expireDate,
      );

      if (payResponse is SuccessfulPayResponse) {
        onPaymentSuccessWithout3dsVerification?.call(payResponse);
      } else if (payResponse is Verification3dsPayResponse) {
        onPaymentRequiring3dsVerification?.call(payResponse);
      } else if (payResponse is UnknownPayResponse) {
        throw UnknownYouCanPayException(
          message:
              payResponse.decodedJsonResponse['message'] ?? 'Unknown error',
        );
      }
    } on YouCanPayException catch (exception, stackTrace) {
      onPaymentFailed?.call(exception, stackTrace);
    }
  }
}
