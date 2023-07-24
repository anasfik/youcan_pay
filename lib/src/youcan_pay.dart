import 'package:youcan_pay/src/modules/account/account.dart';

import 'package:youcan_pay/src/modules/balance_history/balance_history.dart';

import 'package:youcan_pay/src/modules/currencies/currencies.dart';

import 'package:youcan_pay/src/modules/deposits/deposits.dart';

import 'package:youcan_pay/src/modules/invoices/invoices.dart';

import 'package:youcan_pay/src/modules/payments/payments.dart';

import 'package:youcan_pay/src/modules/transfers/transfers.dart';

import 'package:youcan_pay/src/modules/withdrawals/withdrawals.dart';

import 'base/youcan_pay_base.dart';

final class YouCanPay implements YouCanPayBase {
  @override
  // TODO: implement account
  YouCanPayAccounts get account => throw UnimplementedError();

  @override
  // TODO: implement balanceHistory
  YouCanPayBalanceHistory get balanceHistory => throw UnimplementedError();

  @override
  // TODO: implement currencies
  YouCanPayCurrencies get currencies => throw UnimplementedError();

  @override
  // TODO: implement deposits
  YouCanPayDeposits get deposits => throw UnimplementedError();

  @override
  // TODO: implement invoices
  YouCanPayInvoices get invoices => throw UnimplementedError();

  @override
  // TODO: implement payments
  YouCanPayPayments get payments => throw UnimplementedError();

  @override
  // TODO: implement transfers
  YouCanPayTransfers get transfers => throw UnimplementedError();

  @override
  // TODO: implement withdrawals
  YouCanPayWithdrawals get withdrawals => throw UnimplementedError();
}
