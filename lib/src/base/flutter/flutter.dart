import 'package:flutter/material.dart';
import '../../flutter/models/card.dart';
import '../../utils/typedefs.dart';

abstract interface class YouCanPayFlutterBase {
  void processPay(
    BuildContext context, {
    required String paymentToken,
    required String pubKey,
    required YouCanPayCard card,
    PaymentFailureHandler? onPaymentFailed,
    Verification3dsFailedHandler? on3dsVerificationFailed,
    PaymentSuccessWithout3dsVerificationHandler?
        onPaymentSuccessWithout3dsVerification,
    PaymentSuccessWith3dsVerificationHandler?
        onPaymentSuccessWith3dsVerification,
  });

  void paymentFlowBuilder(
    BuildContext context, {
    required String paymentToken,
    required String pubKey,
    required YouCanPayCard card,
    PaymentFailureHandler? onPaymentFailed,
    PaymentSuccessWithout3dsVerificationHandler?
        onPaymentSuccessWithout3dsVerification,
    Verification3dsSuccessHandler? onPaymentSuccessWith3dsVerification,
    PaymentRequiring3dsVerificationHandler? onPaymentRequiring3dsVerification,
  });
}
