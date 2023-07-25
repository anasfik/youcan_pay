import 'dart:convert';
import 'dart:io';

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
    Map<String, dynamic>? customHeaders,
    required T Function(Map<String, dynamic> decodedResponse) onSuccess,
  }) async {
    final request = http.MultipartRequest(
      method.name.toUpperCase(),
      Uri.parse(endpoint),
    );

    for (int index = 0; index < body.entries.length; index++) {
      final current = body.entries.elementAt(index);
      request.fields[current.key] = current.value.toString();
    }

    final res = await request.send();
    final resString = await res.stream.bytesToString();
    final decodedResponse = await jsonDecode(resString);

    if (res.statusCode.isOk) {
      return onSuccess(decodedResponse);
    } else {
      throw YouCanPayExceptionDecidedByStatusCode(
        statusCode: res.statusCode,
      )("messageShouldBeHere");
    }

//
//     switch (method) {
//       case YouCanPayNetworkingClientMethod.get:
//         return _sendGetRequestFromJson<T>(
//           endpoint: endpoint,
//           body: body,
//           customHeaders: customHeaders,
//           onSuccess: onSuccess,
//         );
//
//       case YouCanPayNetworkingClientMethod.post:
//       // return _sendPostRequestFromJson<T>(
//       //   endpoint: endpoint,
//       //   body: body,
//       //   customHeaders: customHeaders,
//       //   onSuccess: onSuccess,
//       // );
//
//       default:
//         throw Exception('Method $method not implemented');
//     }
  }

  // static Future<T> _sendGetRequestFromJson<T extends YouCanPayDataModel>({
  //   required String endpoint,
  //   Map<String, dynamic>? customHeaders,
  //   required Map<String, dynamic> body,
  //   required T Function(Map<String, dynamic> decodedResponse) onSuccess,
  // }) async {
  //   }
}
