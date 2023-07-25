import 'package:youcan_pay/src/exceptions/exception.dart';
import 'package:youcan_pay/src/youcan_pay.dart';

void main() async {
  try {
    final res = await YouCanPay.instance.account.register(
      email: "example@gmail.com",
      firstName: "John",
      lastName: "Doe",
      password: "12345678",
      phone: "+212666666666",
    );

    print(res.message);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }
}
