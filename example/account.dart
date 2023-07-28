import 'dart:math';

import 'package:youcan_pay/youcan_pay.dart';

void main() async {
  YouCanPay.instance.isSandbox = true;

  try {
    final res = await YouCanPay.instance.account.accounfConfig(
      pubKey: "pub_0e217f99-b81c-426e-afd8-0c7c16e7",
    );

    print(res.cashPlusTransactionEnabled);
  } catch (e) {
    print(e);
  }
  final random = Random().nextInt(99999999);

  final email = "example$random@gmail.com";
  final phone = "+2126$random";
  final password = "12345678";
  try {
    final res = await YouCanPay.instance.account.register(
      email: email,
      firstName: "John",
      lastName: "Doe",
      password: password,
      phone: phone,
    );

    print(res.message);
  } on YouCanPayException catch (e) {
    switch (e) {
      case YouCanPayNotFoundException():
        print("Not found");
        break;

      case YouCanPayBadRequestException():
        print("Bad request");
        break;

      case YouCanPayServerErrorException():
        print("Server error");
        break;

      case YouCanPayUnAuthorizedException():
        print("UnAuthorized");
        break;

      case YouCanPayUnprocessableEntityException():
        print("UnprocessableEntity");
        break;

      default:
        print("Unknown error");
    }
    print(e.message);
    print(e.statusCode);
  }

  late String token;
  try {
    final res = await YouCanPay.instance.account.login(
      emailOrPhone: email,
      password: password,
    );
    token = res.token;
    print(res.token);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }

  try {
    final res = await YouCanPay.instance.account.me(
      token: token,
    );

    print(res.address);
    print(res.email);
    print(res.phone);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }

  try {
    final res = await YouCanPay.instance.account.updateAccount(
      token: token,
      firstName: "anas fikhi",
      adress: "...",
    );

    print(res.message);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }

  try {
    final res = await YouCanPay.instance.account.updatePassword(
      token: token,
      currentPassword: password,
      newPassword: "123456789",
    );

    print(res.message);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }

  try {
    final res = await YouCanPay.instance.account.stats(
      token: token,
      fromDate: DateTime.now().subtract(Duration(days: 5)),
      toDate: DateTime.now(),
      interval: YouCanPayStatsInterval.thisWeek,
    );

    print(res.fromDate);
    print(res.totalRevenue);
    print(
      res.paidTransactionsByDates
          .map((e) => "${e.date} ${e.totalAmount}")
          .join("\n"),
    );
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }

  try {
    final res = await YouCanPay.instance.account.refreshToken(
      token: token,
    );

    print(res.token);
    token = res.token;
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }

  try {
    final isLoggedOut = await YouCanPay.instance.account.logout(
      token: token,
    );

    print(isLoggedOut);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }
}
