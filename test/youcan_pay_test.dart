//! coming next..

import 'dart:math';

import 'package:test/test.dart';
import 'package:youcan_pay/src/base/youcan_pay_account_base.dart';
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

import 'vars.dart';

void main() {
  final random = Random().nextInt(99999999);

  final email = "example$random@gmail.com";
  final phone = "+2126$random";
  final password = "12345678";
  late String authUserToken;

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

  group("Account Test Group", () {
    test("Account Config", () async {
      final accountConfig = await YouCanPay.instance.account.accounfConfig(
        pubKey: pubKey,
      );

      expect(accountConfig, isA<YouCanPayAccountConfig>());

      // !
    });

    test("Register", () async {
      final registerResponse = await YouCanPay.instance.account.register(
        email: email,
        firstName: "John",
        lastName: "Doe",
        password: password,
        phone: phone,
      );

      expect(registerResponse, isA<RegisterResponse>());
      // !
    });

    test("login", () async {
      final loginResponse = await YouCanPay.instance.account.login(
        emailOrPhone: email,
        password: password,
      );
      authUserToken = loginResponse.token;
      expect(loginResponse, isA<LoginResponse>());
      // !
    });

    test("user personal infor (me)", () async {
      final userInfo = await YouCanPay.instance.account.me(
        token: authUserToken,
      );

      expect(userInfo, isA<YouCanUserInformations>());
      // !
    });
    test("Update Account ", () async {
      final userInfo = await YouCanPay.instance.account.updateAccount(
        token: authUserToken,
        firstName: "John",
        lastName: "Doe",
      );

      expect(userInfo, isA<RegisterResponse>());
      // !
    });

    test("Update Password ", () async {
      final userInfo = await YouCanPay.instance.account.updatePassword(
        token: authUserToken,
        currentPassword: password,
        newPassword: "123456789",
      );

      expect(userInfo, isA<RegisterResponse>());
      // !
    });

    test("user stats", () async {
      final userStats = await YouCanPay.instance.account.stats(
        token: authUserToken,
        fromDate: DateTime.now().subtract(Duration(days: 30)),
        toDate: DateTime.now(),
        interval: YouCanPayStatsInterval.today,
      );

      expect(userStats, isA<StatsResponse>());
      // !
    });

    test("Refresh Token", () async {
      final refreshTokenRes = await YouCanPay.instance.account.refreshToken(
        token: authUserToken,
      );
      authUserToken = refreshTokenRes.token;

      expect(refreshTokenRes, isA<RefreshResponse>());
      // !
    });

    test("logout", () async {
      final logoutResponse = await YouCanPay.instance.account.logout(
        token: authUserToken,
      );

      expect(logoutResponse, isA<LogoutResponse>());
      // !
    });
  });
  group("balance History Test Group", () {
    test("balance history", () async {
      final balanceHistory = await YouCanPay.instance.balanceHistory.history(
        token: authUserToken,
      );

      expect(balanceHistory, isA<YouCanPayBalanceHistoryPagination>());
      // !
    });
  });
}
