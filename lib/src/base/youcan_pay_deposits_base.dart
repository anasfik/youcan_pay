import '../models/deposits/deposite.dart';

abstract interface class YouCanPayDepositsBase {
  Future<DepositResponse> tokenize({
    required int amount,
    required String currency,
  });
}
