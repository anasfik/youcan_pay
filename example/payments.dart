import 'package:youcan_pay/src/exceptions/exception.dart';
import 'package:youcan_pay/src/youcan_pay.dart';

void main() async {
  try {
    final res = await YouCanPay.instance.payments.tokenize(
      amount: 1500,
      priKey: "pri_bc461sd7e-a29a-40e3-b9bd-55b44424",
      currency: "MAD",
      orderId: "orderId",
    );
    print(res.token);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }
}
