import 'package:youcan_pay/src/utils/enums.dart';

import '../../base/youcan_pay_invoices_base.dart';
import '../../base/youcan_pay_module.dart';

final class YouCanPayInvoices
    implements YouCanPayModule, YouCanPayInvoicesBase {
  static final YouCanPayInvoices _instance = YouCanPayInvoices._();
  static YouCanPayInvoices get instance => _instance;
  YouCanPayInvoices._();

  @override
  Type get type => runtimeType;

  @override
  Future create({
    required String reference,
    required String name,
    required int amount,
    required String currency,
    required int contactOption,
    required String description,
    required String to,
    required bool active,
    required String content,
  }) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future invoices({
    required String token,
    required YouCanPayInvoicesSortField sortField,
    required YouCanPaySortOrder sortOrder,
    required int limit,
  }) {
    // TODO: implement invoices
    throw UnimplementedError();
  }

  @override
  // TODO: implement endpoints
  List<String> get endpoints => throw UnimplementedError();
}
