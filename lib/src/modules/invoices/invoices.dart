import 'package:youcan_pay/src/models/invoices/tokenize.dart';
import 'package:youcan_pay/src/utils/enums.dart';

import '../../base/youcan_pay_invoices_base.dart';
import '../../base/youcan_pay_module.dart';
import '../../models/invoices/invoice.dart';
import '../../models/invoices/invoices.dart';
import '../../networking/client.dart';
import '../../networking/endpoint.dart';
import '../../networking/headers.dart';
import '../../utils/consts.dart';

final class YouCanPayInvoices
    implements YouCanPayModule, YouCanPayInvoicesBase {
  static final YouCanPayInvoices _instance = YouCanPayInvoices._();
  static YouCanPayInvoices get instance => _instance;
  YouCanPayInvoices._();

  @override
  Type get type => runtimeType;

  @override
  Future<YouCanPayInvoice> create({
    String? reference,
    required String token,
    required String name,
    required int amount,
    required String currency,
    required int contactOption,
    String? description,
    String? to,
    int? active,
    String? content,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<YouCanPayInvoice>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.invoices,
      ]),
      body: {
        'name': name,
        'amount': amount,
        'currency': currency,
        'contact_option': contactOption,
        if (reference != null) 'reference': reference,
        if (description != null) 'description': description,
        if (to != null) 'to': to,
        if (active != null) 'active': active,
        if (content != null) 'content': content,
      },
      method: YouCanPayNetworkingClientMethod.post,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return YouCanPayInvoice.fromMap(map['data']);
      },
    );
  }

  @override
  Future<YouCanPayInvoicesPagination> invoices({
    required String token,
    YouCanPayInvoicesSortField? sortField,
    YouCanPaySortOrder? sortOrder,
    int? limit,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<
        YouCanPayInvoicesPagination>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.transfers,
        "?sort_field=${sortField?.snakeCasedName}",
        "&sort_order=${sortOrder?.snakeCasedName}",
      ]),
      body: {},
      method: YouCanPayNetworkingClientMethod.get,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return YouCanPayInvoicesPagination.fromMap(map);
      },
    );
  }

  @override
  Future<YouCanInvoiceTokenization> tokenize({
    required String token,
    required String invoiceId,
  }) {
    return YouCanPayNetworkingClient.sendJsonRequestFromJson<
        YouCanInvoiceTokenization>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.invoices,
        YouCanPayConstants.endpoints.tokenize,
        invoiceId,
      ]),
      body: {},
      method: YouCanPayNetworkingClientMethod.post,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return YouCanInvoiceTokenization.fromMap(map['data']);
      },
    );
  }
}
