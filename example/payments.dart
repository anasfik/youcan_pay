import 'package:youcan_pay/src/exceptions/exception.dart';
import 'package:youcan_pay/src/youcan_pay.dart';

void main() async {
  late String paymentToken;
  try {
    final res = await YouCanPay.instance.payments.tokenize(
      amount: 1500,
      priKey: "pri_bc461d7e-a29a-40e3-b9bd-55b44424",
      currency: "MAD",
      orderId: "orderId",
    );
    paymentToken = res.token;
    print(res.token);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }

  try {
    final res = await YouCanPay.instance.payments.cashPlusInit(
      pubKey: "pub_0e217f99-b81c-426e-afd8-0c7c16e7",
      tokenId: paymentToken,
    );
    print(res.tokenId);
    print(res.transactionId);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }
}
