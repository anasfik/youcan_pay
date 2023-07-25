import 'package:youcan_pay/src/modules/account/account.dart';

import 'package:youcan_pay/src/modules/balance_history/balance_history.dart';

import 'package:youcan_pay/src/modules/currencies/currencies.dart';

import 'package:youcan_pay/src/modules/deposits/deposits.dart';

import 'package:youcan_pay/src/modules/invoices/invoices.dart';

import 'package:youcan_pay/src/modules/payments/payments.dart';

import 'package:youcan_pay/src/modules/transfers/transfers.dart';

import 'package:youcan_pay/src/modules/withdrawals/withdrawals.dart';
import 'package:youcan_pay/src/utils/consts.dart';

import 'base/youcan_pay_base.dart';

final class YouCanPay implements YouCanPayBase {
  static YouCanPay _instance = YouCanPay._();
  static YouCanPay get instance => _instance;

  YouCanPay._();

  String? _baseUrl;
  @override
  YouCanPayAccounts get account => YouCanPayAccounts.instance;

  @override
  YouCanPayBalanceHistory get balanceHistory =>
      YouCanPayBalanceHistory.instance;

  @override
  YouCanPayCurrencies get currencies => YouCanPayCurrencies.instance;

  @override
  YouCanPayDeposits get deposits => YouCanPayDeposits.instance;

  @override
  YouCanPayInvoices get invoices => YouCanPayInvoices.instance;

  @override
  YouCanPayPayments get payments => YouCanPayPayments.instance;

  @override
  YouCanPayTransfers get transfers => YouCanPayTransfers.instance;

  @override
  YouCanPayWithdrawals get withdrawals => YouCanPayWithdrawals.instance;

  @override
  String get baseUrl => _baseUrl ?? YouCanPayConstants.baseUrl;

  @override
  set baseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }
}
