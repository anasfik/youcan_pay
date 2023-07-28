import 'package:youcan_pay/src/exceptions/exception.dart';
import 'package:youcan_pay/src/models/payments/3ds_pay_response.dart';
import 'package:youcan_pay/src/models/payments/expiry_date.dart';
import 'package:youcan_pay/src/models/payments/successful_pay.dart';
import 'package:youcan_pay/src/models/payments/unknown_pay.dart';
import 'package:youcan_pay/src/models/payments/unsuccessful_pay.dart';
import 'package:youcan_pay/src/youcan_pay.dart';

void main() async {
  // YouCanPay.instance.isSandbox = true;

  late String paymentToken;
  try {
    final res = await YouCanPay.instance.payments.tokenize(
      amount: 150000,
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

  // try {
  //   final res = await YouCanPay.instance.payments.cashPlusInit(
  //     pubKey: "pub_0e217f99-b81c-426e-afd8-0c7c16e7",
  //     tokenId: paymentToken,
  //   );
  //   print(res.tokenId);
  //   print(res.transactionId);
  // } on YouCanPayException catch (e) {
  //   print(e.message);
  //   print(e.statusCode);
  // }

  try {
    final payResponse = await YouCanPay.instance.payments.pay(
      pubKey: "pub_sandbox_10277a4b-96a0-4d1a-b632-d9886",
      tokenId: paymentToken,
      cardHolderName: "somthing",
      creditCard: 4242424242424242,
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

  try {
    final payResponse = await YouCanPay.instance.payments.authorize(
      pubKey: "pub_sandbox_10277a4b-96a0-4d1a-b632-d9886",
      tokenId: paymentToken,
      cardHolderName: "somthing",
      creditCard: 4242424242424242,
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
