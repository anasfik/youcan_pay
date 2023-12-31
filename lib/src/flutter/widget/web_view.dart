import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youcan_pay/src/models/export.dart';
import 'package:youcan_pay/src/utils/extension.dart';
import 'package:youcan_pay/src/utils/typedefs.dart';

import '../../../youcan_pay.dart';

class Verification3dsWebView extends StatefulWidget {
  const Verification3dsWebView({
    super.key,
    required this.verification3dsPayResponse,
    required this.on3dsVerificationFailed,
    required this.onPaymentSuccessWith3dsVerification,
  });

  final Verification3dsFailedHandler? on3dsVerificationFailed;

  final PaymentSuccessWith3dsVerificationHandler?
      onPaymentSuccessWith3dsVerification;

  final Verification3dsPayResponse verification3dsPayResponse;

  @override
  State<Verification3dsWebView> createState() => _Verification3dsWebViewState();
}

class _Verification3dsWebViewState extends State<Verification3dsWebView> {
  WebViewController? webViewController;
  String? lastOpenedUrl;

  @override
  void initState() {
    webViewController = WebViewController();
    webViewController!.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController!
        .loadRequest(Uri.parse(widget.verification3dsPayResponse.redirectUrl!));
    webViewController!.setNavigationDelegate(NavigationDelegate(
      onUrlChange: _onUrlChangeToTriggerSuccessStatus,
    ));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onUrlChangeToTriggerSuccessStatus(UrlChange urlChange) {
    final queryParameters = urlChange.queryParameters;

    final paymentSuccessStatus = queryParameters['success'];

    if (paymentSuccessStatus == null || lastOpenedUrl == urlChange.url) {
      return;
    }

    lastOpenedUrl = urlChange.url;
    switch (paymentSuccessStatus) {
      case "1":
        final successRes = SuccessfulPayResponse.fromMap(queryParameters);

        widget.onPaymentSuccessWith3dsVerification?.call(context, successRes);
        break;
      case "0":
        final unSuccessRes = UnSuccessfulPayResponse.fromMap(queryParameters);
        widget.on3dsVerificationFailed?.call(context, unSuccessRes);
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: webViewController!,
      ),
    );
  }
}
