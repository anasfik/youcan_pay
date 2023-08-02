import 'package:flutter/material.dart';
import 'package:youcan_pay/src/exceptions/exception.dart';

abstract interface class YouCanPayFlutterBase {
  void startPaymentFlow(
    BuildContext context, {
    required String paymentToken,
    required void Function(YouCanPayException exception, dynamic stacktrace)
        onPaymentFailed,
    required void Function() onPaymentSuccess,
  });
}
