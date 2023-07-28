import 'package:youcan_pay/youcan_pay.dart';

void main() async {
  final token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wveW91Y2FucGF5LmNvbVwvYXBpXC9sb2dpbiIsImlhdCI6MTY5MDMyMDU0OCwiZXhwIjoxNjkyOTQ4NTQ4LCJuYmYiOjE2OTAzMjA1NDgsImp0aSI6IjRsdzdJZHo0cjh2QXlmRUEiLCJzdWIiOiIxYWQ1YjlmYy1jZTM5LTQ3MWMtYmI5Yy0wZjBhYzgyMTU2MTkiLCJwcnYiOiJjN2UxODM1MmVmODFlNmIyZjJkMzk2MDk2ODg1ZjUxNzYwYzIyMTMxIiwiZmlyc3RfbmFtZSI6IkpvaG4iLCJsYXN0X25hbWUiOiJEb2UiLCJlbWFpbCI6ImV4YW1wbGU3NzQ5MzEwMUBnbWFpbC5jb20iLCJwaG9uZSI6IisyMTI2Nzc0OTMxMDEiLCJ0eXBlIjoyfQ.yGfi0raFIaoF03S9EeSxiUe-QFqeISaRMAsmehsCnYw";

  try {
    final res = await YouCanPay.instance.deposits.tokenize(
      token: token,
      amount: 1000,
      currency: 'MAD',
    );

    print(res.tokenId);
  } on YouCanPayException catch (e) {
    print(e.message);
    print(e.statusCode);
  }
}
