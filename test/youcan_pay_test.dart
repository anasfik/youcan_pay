//! coming next..

import 'package:test/test.dart';
import 'package:youcan_pay/src/modules/account/account.dart';
import 'package:youcan_pay/src/modules/balance_history/balance_history.dart';
import 'package:youcan_pay/src/modules/currencies/currencies.dart';
import 'package:youcan_pay/src/modules/deposits/deposits.dart';
import 'package:youcan_pay/src/modules/invoices/invoices.dart';
import 'package:youcan_pay/src/modules/payments/payments.dart';
import 'package:youcan_pay/src/modules/transfers/transfers.dart';
import 'package:youcan_pay/src/modules/withdrawals/withdrawals.dart';
import 'package:youcan_pay/src/utils/consts.dart';
import 'package:youcan_pay/youcan_pay.dart';

void main() {
  group('YouCanPay', () {
    test('should return an instance of YouCanPay', () {
      expect(YouCanPay.instance, isA<YouCanPay>());
    });

    test('should return an instance of YouCanPayAccounts', () {
      expect(YouCanPay.instance.account, isA<YouCanPayAccounts>());
    });

    test('should return an instance of YouCanPayBalanceHistory', () {
      expect(YouCanPay.instance.balanceHistory, isA<YouCanPayBalanceHistory>());
    });

    test('should return an instance of YouCanPayCurrencies', () {
      expect(YouCanPay.instance.currencies, isA<YouCanPayCurrencies>());
    });

    test('should return an instance of YouCanPayDeposits', () {
      expect(YouCanPay.instance.deposits, isA<YouCanPayDeposits>());
    });

    test('should return an instance of YouCanPayInvoices', () {
      expect(YouCanPay.instance.invoices, isA<YouCanPayInvoices>());
    });

    test('should return an instance of YouCanPayPayments', () {
      expect(YouCanPay.instance.payments, isA<YouCanPayPayments>());
    });

    test('should return an instance of YouCanPayTransfers', () {
      expect(YouCanPay.instance.transfers, isA<YouCanPayTransfers>());
    });

    test('should return an instance of YouCanPayWithdrawals', () {
      expect(YouCanPay.instance.withdrawals, isA<YouCanPayWithdrawals>());
    });

    test('should return the default base URL', () {
      expect(YouCanPay.instance.baseUrl, equals(YouCanPayConstants.baseUrl));
    });

    test('should set the base URL', () {
      final newBaseUrl = 'https://example.com';
      YouCanPay.instance.baseUrl = newBaseUrl;
      expect(YouCanPay.instance.baseUrl, equals(newBaseUrl));
    });

    test('should return the default sandbox value', () {
      expect(
          YouCanPay.instance.isSandbox, equals(YouCanPayConstants.isSandbox));
    });

    test('should set the sandbox value', () {
      final newSandboxValue = true;
      YouCanPay.instance.isSandbox = newSandboxValue;
      expect(YouCanPay.instance.isSandbox, equals(newSandboxValue));
    });
  });
}
