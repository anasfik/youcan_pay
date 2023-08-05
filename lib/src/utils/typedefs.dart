import 'package:flutter/material.dart';

import '../../youcan_pay.dart';

typedef PaymentFailureHandler = void Function(
    YouCanPayException exception, dynamic stacktrace);
typedef PaymentRequiring3dsVerificationHandler = void Function(
    Verification3dsPayResponse verification3dsPayResponse);

typedef PaymentSuccessWithout3dsVerificationHandler = void Function(
    SuccessfulPayResponse successfulPayResponse);
typedef PaymentSuccessWith3dsVerificationHandler = void Function(
    BuildContext context, SuccessfulPayResponse successfulPayResponse);

typedef Verification3dsFailedHandler = void Function(
    BuildContext context, UnSuccessfulPayResponse unSuccessfulPayResponse);

typedef Verification3dsSuccessHandler = void Function(
    SuccessfulPayResponse successfulPayResponse);
