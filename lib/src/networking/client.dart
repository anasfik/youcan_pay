import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youcan_pay/src/networking/headers.dart';
import 'package:youcan_pay/src/utils/extension.dart';

import '../models/model.dart';
import '../utils/enums.dart';
import '../utils/exception_decider.dart';

abstract class YouCanPayNetworkingClient {
  // HttpClient client = HttpClient();

  static Future<T> sendFormRequestFromJson<T extends YouCanPayDataModel>({
    required String endpoint,
    required Map<String, dynamic> body,
    required YouCanPayNetworkingClientMethod method,
    Map<String, String>? customHeaders,
    required T Function(Map<String, dynamic> decodedResponse) onSuccess,
  }) async {
    final request = http.MultipartRequest(
      method.name.toUpperCase(),
      Uri.parse(endpoint),
    );

    request.headers.addAll(
      customHeaders ??
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader().headers,
    );

    for (int index = 0; index < body.entries.length; index++) {
      final current = body.entries.elementAt(index);
      request.fields[current.key] = current.value.toString();
    }

    final res = await request.send();
    final resString = await res.stream.bytesToString();
    final decodedResponse = jsonDecode(resString);

    if (res.statusCode.isOk) {
      return onSuccess(decodedResponse);
    } else {
      final message = decodedResponse["message"] ?? decodedResponse;

      throw YouCanPayExceptionDecidedByStatusCode(
        statusCode: res.statusCode,
      )(message);
    }
  }
}
