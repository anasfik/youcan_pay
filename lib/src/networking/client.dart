import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youcan_pay/src/networking/headers.dart';
import 'package:youcan_pay/src/utils/consts.dart';
import 'package:youcan_pay/src/utils/extension.dart';

import '../models/youcan_model.dart';
import '../utils/enums.dart';
import '../utils/exception_decider.dart';

/// This class is responsible for sending requests to the server and returning the response in a dynamic way.
abstract class YouCanPayNetworkingClient {
  /// Sends an multi part (form) request to an [endpoint] with the given HTTP [method], it takes a normal JSON [body] that is handled internally to fit as a multi part body.
  ///
  /// This method includes internally the pre-defined headers from the `HeadersBuilder` class, unless `customHeaders` is specified, which then uses it instead.
  ///
  /// when a request is completed siccesfully with a response, the `onSuccess` method will be called with it.
  ///
  /// if the response status code is not an ok code (200-299), then it throws a `YouCanPayException` based on that status code.
  static Future<T> sendFormRequestFromJson<T extends YouCanPayDataModel>({
    required String endpoint,
    required Map<String, dynamic> body,
    required YouCanPayNetworkingClientMethod method,
    Map<String, String>? customHeaders,
    required T Function(Map<String, dynamic> decodedResponse) onSuccess,
  }) async {
    _assertMatchingKeysWithSandboxMode(body.entries);
    final request = http.MultipartRequest(
      method.name.toUpperCase(),
      Uri.parse(endpoint),
    );

    request.headers.addAll(
      customHeaders ?? HeadersBuilder().addAcceptJsonHeader().headers,
    );

    for (int index = 0; index < body.entries.length; index++) {
      final current = body.entries.elementAt(index);
      request.fields[current.key] = current.value.toString();
    }

    final res = await request.send();
    final resString = await res.stream.bytesToString();
    late Map<String, dynamic> decodedResponse;
    try {
      if (resString == "[]") {
        decodedResponse = {};
      } else {
        decodedResponse = jsonDecode(resString);
      }
    } catch (e) {
      throw YouCanPayExceptionDecidedByStatusCode(
        statusCode: res.statusCode,
      )(resString);
    }

    if (res.statusCode.isOk) {
      return onSuccess(decodedResponse);
    } else {
      final message = decodedResponse["message"] ?? decodedResponse.toString();

      throw YouCanPayExceptionDecidedByStatusCode(
        statusCode: res.statusCode,
      )(message);
    }
  }

  /// Sends a request to an [endpoint] with the given HTTP [method], it uses the JSON [body].
  ///
  /// This method includes internally the pre-defined headers from the `HeadersBuilder` class, unless `customHeaders` is specified, which then uses it instead.
  ///
  /// when a request is completed siccesfully with a response, the `onSuccess` method will be called with it.
  ///
  /// if the response status code is not an ok code (200-299), then it throws a `YouCanPayException` based on that status code.
  static Future<T> sendJsonRequestFromJson<T extends YouCanPayDataModel>({
    required String endpoint,
    required Map<String, dynamic> body,
    required YouCanPayNetworkingClientMethod method,
    Map<String, String>? customHeaders,
    required T Function(Map<String, dynamic> decodedResponse) onSuccess,
  }) async {
    _assertMatchingKeysWithSandboxMode(body.entries);

    switch (method) {
      case YouCanPayNetworkingClientMethod.get:
        return _getRequestFromJson(
          body: body,
          endpoint: endpoint,
          onSuccess: onSuccess,
          customHeaders: customHeaders,
        );

      case YouCanPayNetworkingClientMethod.post:
        return _postRequestFromJson(
          body: body,
          endpoint: endpoint,
          onSuccess: onSuccess,
          customHeaders: customHeaders,
        );
      case YouCanPayNetworkingClientMethod.put:
        return _putRequestFromJson(
          body: body,
          endpoint: endpoint,
          onSuccess: onSuccess,
          customHeaders: customHeaders,
        );
      default:
        throw Exception();
    }
  }

  static Future<T> _getRequestFromJson<T extends YouCanPayDataModel>({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? customHeaders,
    required T Function(Map<String, dynamic> decodedResponse) onSuccess,
  }) async {
    final res = await http.get(
      Uri.parse(endpoint),
      headers: customHeaders ?? HeadersBuilder().addAcceptJsonHeader().headers,
    );

    final decodedResponse = jsonDecode(res.body);

    if (res.statusCode.isOk) {
      return onSuccess(decodedResponse);
    } else {
      final message = decodedResponse["message"] ?? decodedResponse.toString();

      throw YouCanPayExceptionDecidedByStatusCode(
        statusCode: res.statusCode,
      )(message);
    }
  }

  static Future<T> _postRequestFromJson<T extends YouCanPayDataModel>({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? customHeaders,
    required T Function(Map<String, dynamic> decodedResponse) onSuccess,
  }) async {
    final res = await http.post(
      Uri.parse(endpoint),
      headers: customHeaders ?? HeadersBuilder().addAcceptJsonHeader().headers,
      body: body,
    );

    final decodedResponse = jsonDecode(res.body);

    if (res.statusCode.isOk) {
      return onSuccess(decodedResponse);
    } else {
      final message = decodedResponse["message"] ?? decodedResponse.toString();

      throw YouCanPayExceptionDecidedByStatusCode(
        statusCode: res.statusCode,
      )(message);
    }
  }

  static Future<T> _putRequestFromJson<T extends YouCanPayDataModel>({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? customHeaders,
    required T Function(Map<String, dynamic> decodedResponse) onSuccess,
  }) async {
    final res = await http.put(
      Uri.parse(endpoint),
      headers: customHeaders ?? HeadersBuilder().addAcceptJsonHeader().headers,
      body: body,
    );

    final decodedResponse = jsonDecode(res.body);

    if (res.statusCode.isOk) {
      return onSuccess(decodedResponse);
    } else {
      final message = decodedResponse["message"] ?? decodedResponse.toString();

      throw YouCanPayExceptionDecidedByStatusCode(
        statusCode: res.statusCode,
      )(message);
    }
  }

  static void _assertMatchingKeysWithSandboxMode(
    Iterable<MapEntry<String, dynamic>> mapEndtries,
  ) {
    final isSandbox = YouCanPayConstants.isSandbox;

    for (int index = 0; index < mapEndtries.length; index++) {
      final current = mapEndtries.elementAt(index);
      final key = current.key;
      final value = current.value;

      if (key == "pub_key" || key == "pri_key") {
        assert(value.contains("sandbox") == isSandbox, """
         You are setting the package to the sandbox mode, accuratly you did:
         YouCanPay.instance.isSandbox = true;

         but the keys you are using are not sandbox keys, please use sandbox keys.
        """);
      }
    }
  }
}
