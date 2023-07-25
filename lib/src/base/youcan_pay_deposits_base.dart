import '../models/deposits/deposite.dart';

abstract interface class YouCanPayDepositsBase {
  Future<DepositResponse> tokenize({
    required String token,
    required int amount,
    required String currency,
  });
}
