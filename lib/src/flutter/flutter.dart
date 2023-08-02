import 'package:flutter/material.dart';
import 'package:youcan_pay/src/exceptions/exception.dart';

import '../base/flutter/flutter.dart';

final class YouCanPayFlutter implements YouCanPayFlutterBase {
  static final YouCanPayFlutter _instance = YouCanPayFlutter._();
  static YouCanPayFlutter get instance => _instance;

  YouCanPayFlutter._();

  @override
  void startPaymentFlow(
    BuildContext context, {
    required String paymentToken,
    required void Function(YouCanPayException exception, dynamic stacktrace)
        onPaymentFailed,
    required void Function() onPaymentSuccess,
  }) {}
}
