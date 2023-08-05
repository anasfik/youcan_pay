import 'package:flutter/material.dart';
import 'package:youcan_pay/src/exceptions/exception.dart';

import '../../flutter/models/card.dart';
import '../../models/export.dart';

abstract interface class YouCanPayFlutterBase {
  void processPay(
    BuildContext context, {
    required String paymentToken,
    required String pubKey,
    required YouCanPayCard card,
    void Function(YouCanPayException exception, dynamic stacktrace)?
        onPaymentFailed,
    void Function(BuildContext context,
            UnSuccessfulPayResponse unSuccessfulPayResponse)?
        on3dsVerificationFailed,
    void Function(SuccessfulPayResponse successfulPayResponse)?
        onPaymentSuccessWithout3dsVerification,
    void Function(
            BuildContext context, SuccessfulPayResponse successfulPayResponse)?
        onPaymentSuccessWith3dsVerification,
  });

  void paymentFlowBuilder(
    BuildContext context, {
    required String paymentToken,
    required YouCanPayCard card,
    required String pubKey,
    void Function(YouCanPayException exception, dynamic stacktrace)?
        onPaymentFailed,
    void Function(SuccessfulPayResponse successfulPayResponse)?
        onPaymentSuccessWithout3dsVerification,
    void Function(SuccessfulPayResponse successfulPayResponse)?
        onPaymentSuccessWith3dsVerification,
    void Function(Verification3dsPayResponse verification3dsPayResponse)?
        onPaymentRequiring3dsVerification,
  });
}
