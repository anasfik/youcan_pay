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
import 'package:youcan_pay/src/networking/endpoint.dart';
import 'package:youcan_pay/src/utils/consts.dart';
import 'package:youcan_pay/youcan_pay.dart';

import 'vars.dart';

void main() async {
  final random = Random().nextInt(99999999);

  final email = "example$random@gmail.com";
  final phone = "+2126$random";
  final password = "12345678";
  final newPasswordToUpdateWithLater = "MyNewPassword159";
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

  group("Endpoints builder Test Group", () {
    test("builder", () {
      final builder = YouCanPayEndpointBuilder();

      expect(YouCanPay.instance.isSandbox, false);

      expect(builder([]), "https://youcanpay.com/api");

      expect(
        builder([YouCanPayConstants.endpoints.tokenize]),
        "https://youcanpay.com/api/tokenize",
      );

      expect(
        builder([
          YouCanPayConstants.endpoints.account,
          YouCanPayConstants.endpoints.login,
        ]),
        "https://youcanpay.com/api/account/login",
      );

      expect(
        builder([YouCanPayConstants.endpoints.pay]),
        "https://youcanpay.com/api/pay",
      );

      YouCanPay.instance.isSandbox = true;

      expect(YouCanPay.instance.isSandbox, true);

      expect(builder([]), "https://youcanpay.com/api");

      expect(
        builder([YouCanPayConstants.endpoints.account]),
        "https://youcanpay.com/api/account",
      );

      expect(
        builder([YouCanPayConstants.endpoints.pay]),
        "https://youcanpay.com/sandbox/api/pay",
      );

      expect(
        builder([YouCanPayConstants.endpoints.tokenize]),
        "https://youcanpay.com/sandbox/api/tokenize",
      );

      expect(
        builder([
          YouCanPayConstants.endpoints.invoices,
          YouCanPayConstants.endpoints.tokenize,
        ]),
        "https://youcanpay.com/api/invoices/tokenize",
      );
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
        newPassword: newPasswordToUpdateWithLater,
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

      // Since we logged out, the token is no longer valid, so we will need to login again.
      // This won't be a test.
      try {
        final loginRes = await YouCanPay.instance.account.login(
          emailOrPhone: email,
          password: newPasswordToUpdateWithLater,
        );

        authUserToken = loginRes.token;
      } on YouCanPayException catch (e) {
        rethrow;
      }
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
  group("Currencies Test Group", () {
    test("Conversion rates", () async {
      final currencies = await YouCanPay.instance.currencies.conversionRates(
        token: authUserToken,
      );

      expect(currencies, isA<ConversionRatesResponse>());
      // !
    });
  });
  group("Deposits Test Group", () {
    test("tokenize", () async {
      final tokenize = await YouCanPay.instance.deposits.tokenize(
        token: authUserToken,
        amount: 1000,
        currency: 'MAD',
      );

      expect(tokenize, isA<DepositResponse>());
      // !
    });
  });
  group("Transfers Test Group", () {
    test("Create", () async {
      final transfer = await YouCanPay.instance.transfers.create(
        token: authUserToken,
        amount: 1500,
        identifier: "ffikhi.aanas@gmail.com",
      );

      expect(transfer, isA<YouCanPayTransfer>());
      // !
    });

    test("Transfers List", () async {
      final transfers = await YouCanPay.instance.transfers.transfers(
        token: authUserToken,
      );

      expect(transfers, isA<YouCanPayTransfersPagination>());
      // !
    });

    test("Recent Recipients", () async {
      final recentRecipients =
          await YouCanPay.instance.transfers.recentRecipients(
        token: authUserToken,
      );

      expect(recentRecipients, isA<YouCanPayRecentRecipients>());
      // !
    });
  });
  group("Invoices Test Group", () {
    test("Create", () async {
      final invoice = await YouCanPay.instance.invoices.create(
        token: authUserToken,
        amount: 1500,
        name: "some name",
        currency: "MAD",
        contactOption: 1,
      );

      expect(invoice, isA<YouCanPayInvoice>());
      // !
    });

    test("Invoices List", () async {
      final invoices = await YouCanPay.instance.invoices.invoices(
        token: authUserToken,
      );

      expect(invoices, isA<YouCanPayInvoicesPagination>());
      // !
    });
  });

  group("Withdrawal Test Group", () {
    test("Create", () async {
      final withdrawal = await YouCanPay.instance.withdrawals.create(
        token: authUserToken,
        amount: 1500,
        paymentMethod: YouCanPayPaymentsMethod.bankAccount,
      );

      expect(withdrawal, isA<WithdrawalResponse>());
      // !
    });

    test("Withdrawals List", () async {
      final withdrawals = await YouCanPay.instance.withdrawals.withdrawals(
        token: authUserToken,
      );

      expect(withdrawals, isA<YouCanPayWithdrawalsPagination>());
      // !
    });
  });
}
