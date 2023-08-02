import '../flutter/flutter.dart';
import '../modules/account/account.dart';
import '../modules/balance_history/balance_history.dart';
import '../modules/currencies/currencies.dart';
import '../modules/deposits/deposits.dart';
import '../modules/invoices/invoices.dart';
import '../modules/payments/payments.dart';
import '../modules/transfers/transfers.dart';
import '../modules/withdrawals/withdrawals.dart';

abstract interface class YouCanPayBase {
  String get baseUrl;
  set baseUrl(String baseUrl);

  bool get isSandbox;
  set isSandbox(bool isSandbox);

  YouCanPayPayments get payments;
  YouCanPayAccounts get account;
  YouCanPayCurrencies get currencies;
  YouCanPayTransfers get transfers;
  YouCanPayInvoices get invoices;
  YouCanPayBalanceHistory get balanceHistory;
  YouCanPayWithdrawals get withdrawals;
  YouCanPayDeposits get deposits;
  YouCanPayFlutter get flutter;
}
