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
        const SnackBar(
          content: Text('Payment failed'),
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
                amount: 42000,
                priKey: "pri_sandbox_9f410153-b941-47f5-9154-c1981",
                currency: "MAD",
                orderId: "46846",
              );

              token = res.token;
            } catch (e) {
              print(e);
            }

            YouCanPay.instance.flutter.processPay(
              context,
              paymentToken: token,
              pubKey: "pub_sandbox_10277a4b-96a0-4d1a-b632-d9886",
              card: YouCanPayCard(
                cardHolderName: "anas",
                creditCard: 4000000000003220,
                cvv: 112,
                expireDate: YouCanPayExpireDate(month: 12, year: 2024),
              ),
              on3dsVerificationFailed: (res) {
                _snackBar(res.message);
              },
              onPaymentFailed: (exception, stacktrace) {
                _snackBar(exception.message);
              },
              onPaymentSuccessWithout3dsVerification: (res) {
                _snackBar(res.message);
              },
            );
          },
          child: Text('Pay'),
        ),
      ),
    );
  }
}
