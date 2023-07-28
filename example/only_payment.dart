import 'package:youcan_pay/youcan_pay.dart';

void main() async {
  YouCanPay.instance.isSandbox = true;

  late String paymentToken;

  try {
    final res = await YouCanPay.instance.payments.tokenize(
      amount: 23000,
      priKey: "pri_sandbox_9f410153-b941-47f5-9154-c1981",
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
    final payResponse = await YouCanPay.instance.payments.pay(
      pubKey: "pub_sandbox_10277a4b-96a0-4d1a-b632-d9886",
      tokenId: paymentToken,
      cardHolderName: "somthing",
      creditCard: 4000000000000077,
      cvv: 112,
      expireDate: YouCanPayExpireDate(month: 10, year: 24),
    );

    if (payResponse is SuccessfulPayResponse) {
      print("success payment");
      print(payResponse.transactionId);
      print(payResponse.message);
      print(payResponse.orderId);
    } else if (payResponse is Verification3dsPayResponse) {
      print("3ds verification payment");
      print(payResponse.redirectUrl);
      print(payResponse.returnUrl);
      print(payResponse.transactionId);
    } else if (payResponse is UnSuccessfulPayResponse) {
      print("unsuccessful payment");
      print(payResponse.code);
      print(payResponse.message);
    } else if (payResponse is UnknownPayResponse) {
      print("unknown payment");
      print(payResponse.decodedJsonResponse);
    }
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }
}
