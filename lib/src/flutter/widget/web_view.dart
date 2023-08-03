import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youcan_pay/src/models/export.dart';

class Verification3dsWebView extends StatefulWidget {
  const Verification3dsWebView(this.verification3dsPayResponse, {super.key});

  final Verification3dsPayResponse verification3dsPayResponse;

  @override
  State<Verification3dsWebView> createState() => _Verification3dsWebViewState();
}

class _Verification3dsWebViewState extends State<Verification3dsWebView> {
  WebViewController? webViewController;

  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.verification3dsPayResponse.redirectUrl!));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
