import 'package:flutter/material.dart';
import 'package:youcan_pay/youcan_pay.dart';

void main() {
  YouCanPay.instance.isSandbox = true;

  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouCanPay Flutter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void _snackBar(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('YouCanPay Flutter Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            late String token;

            try {
              final res = await YouCanPay.instance.payments.tokenize(
                amount: 46846,
                priKey: "pri_sandbox_9f410153-b941-47f5-9154-c1981",
                currency: "MAD",
                orderId: "46846",
              );

              token = res.token;

              YouCanPay.instance.flutter.processPay(
                context,
                paymentToken: token,
                pubKey: "pub_sandbox_10277a4b-96a0-4d1a-b632-d9886",
                card: YouCanPayCard.testing3dsSuccessCard(),
                on3dsVerificationFailed: (res) {
                  _snackBar(res.message);
                },
                onPaymentFailed: (exception, stacktrace) {
                  _snackBar(exception.message);
                },
                onPaymentSuccessWithout3dsVerification: (res) {
                  _snackBar(res.message);
                },
                onPaymentSuccessWith3dsVerification: (res) {
                  _snackBar(res.transactionId);
                },
              );
            } catch (e) {
              print(e);
            }
          },
          child: Text('Pay'),
        ),
      ),
    );
  }
}
