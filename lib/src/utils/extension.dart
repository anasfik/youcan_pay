import 'package:webview_flutter/webview_flutter.dart';

extension StatusCodeExtension on int {
  bool get isOk => this >= 200 && this < 300;
}

extension UrlChangeExtension on UrlChange {
  Map<String, String> get queryParameters {
    if (url == null) {
      return {};
    }

    final uri = Uri.parse(url!);
    final queryParameters = uri.queryParameters;
    return queryParameters;
  }
}
