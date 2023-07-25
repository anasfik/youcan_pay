import '../models/transfers/transfer.dart';

abstract interface class YouCanPayTransfers {
  Future<YouCanPayTransfer> create({
    required String token,
    required int amount,
    required String identifier,
    required String message,
  });

// TODO:list all transfers ?? I mean as pages, with sorting...ArgumentError
}
