import 'dart:math';

import 'package:youcan_pay/src/exceptions/exception.dart';
import 'package:youcan_pay/src/youcan_pay.dart';

void main() async {
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
    );

    print(res.message);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }
}
